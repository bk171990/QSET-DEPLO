class Student < ActiveRecord::Base
  include Activity
  belongs_to :country
  belongs_to :batch
  belongs_to :category
  belongs_to :nationality, class_name: 'Country'
  has_one :student_previous_data
  has_many :student_previous_subject_marks
  has_many :guardians
  has_and_belongs_to_many :fee_collection_particulars
  has_and_belongs_to_many :fee_collection_discounts
  has_many :finance_fees
  has_many :student_scores
  has_many :finance_fee_collections, through: :finance_fees
  has_many :student_informations
  
  has_attached_file :image,
  :url => "/assets/students/:basename.:extension",
  :path => ":rails_root/public/assets/students/:basename.:extension"

  validates_attachment_content_type :image, content_type: \
  ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  validates :admission_no, presence: true
  validates :admission_date, presence: true
  validates :email, presence: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }

  validates :first_name, presence: true, format: \
  { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }
  validates_length_of :first_name, minimum: 1, maximum: 20

  validates :last_name, presence: true, format: \
  { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }
  validates_length_of :last_name, minimum: 1, maximum: 20

  validates :date_of_birth, presence: true
  validates :batch_id, presence: true
  validates :nationality_id, presence: true
  validates :country_id, presence: true
  validates :email, presence: true, uniqueness: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }
  validates :middle_name, format: \
  { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }, length: \
  { in: 1..20 }, allow_blank: true
  validates :birth_place, format: \
  { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }, length: \
  { in: 1..20 }, allow_blank: true
  validates :language, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' },
                       length: { in: 1..30 }, allow_blank: true
  validates :religion, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' },
                       length: { in: 1..20 }, allow_blank: true
  validates :address_line1, length: { in: 1..50 }, allow_blank: true
  validates :address_line2, length: { in: 1..50 }, allow_blank: true
  validates :city, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' },
                   length: { in: 1..30 }, allow_blank: true
  validates :state, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' },
                    length: { in: 1..30 }, allow_blank: true

  after_save :create_user_account
  scope :shod, ->(id) { where(id: id).take }
  scope :list, -> { all + ArchivedStudent.all }

  # return batch name by concating course name,batch name
  # and section name
  def batch_name
    [batch.course.course_name, batch.course.section_name, batch.name].join(' ')
  end

  # return student name by concating first name and last name
  def student_name
    [first_name, last_name].join(' ')
  end

  # return student full name by concating
  # first_name, middle_name, last_name
  def stud_full_name
    [first_name, middle_name, last_name].join(' ')
  end

  # return address line by concating address_line1, address_line2
  def address_line
    [address_line1, address_line2].join(' ')
  end

  # return address line by concating first_name,last_name,relation
  def guard_name(p)
    [p.first_name, p.last_name, p.relation].join(' ')
  end

  # This method for create archived student,
  # get all student attributes add  student id,
  # call create method on ArchivedStudent and pass student attributes
  # and create archived student
  def archived_student
    student_attributes = attributes
    student_attributes['student_id'] = id
    ArchivedStudent.create(student_attributes)
  end

  # return full name  by concating first_name,last_name
  def full_name
    [first_name, last_name].join(' ')
  end

  # This action generate the unique student admission no for each student.
  # Admission number is combination of admission date with prefix 'S' and
  # admission count.
  def self.set_admission_no
    date = Date.today.strftime('%Y%m%d')
    if Student.first.nil?
      'S' + date.to_s + '1'
    else
      last_id = Student.last.id.next
      'S' + date.to_s + last_id.to_s
    end
  end

  # This action is used to search the student record.
  def self.search(input, status)
    return if input.empty?
    if status.eql? 'present'
      Student.where("concat_ws(' ',first_name,last_name)like '#{input}%' \
        OR concat_ws(' ',last_name,first_name)like '#{input}%' \
        OR admission_no like '#{input}%' COLLATE utf8_bin")
    else
      ArchivedStudent.where("concat_ws(' ',first_name,last_name)like \
        '#{input}%' OR concat_ws(' ',last_name,first_name)like '#{input}%' \
        OR admission_no like '#{input}%' COLLATE utf8_bin")
    end
  end

  # This action is used to search the student record on the advance basis.
  # It search the record by name, category, batch, course, gender, blood
  # group and so on.
  def self.advance_search(search, batch)
    conditions = ''
    conditions += "concat_ws(' ',first_name,last_name) \
    like '#{search[:name]}%' COLLATE utf8_bin" unless search[:name] == ''
    if batch[:id]
      if conditions == ''
        conditions += "batch_id = #{batch[:id]}" unless batch[:id] == ''
      else
        conditions += " AND batch_id = #{batch[:id]}" unless batch[:id] == ''
      end
    end
    if search[:category_id]
      if conditions == ''
        conditions += "category_id = #{search[:category_id]}" \
        unless search[:category_id] == ''
      else
        conditions += " AND category_id = #{search[:category_id]}" \
        unless search[:category_id] == ''
      end
    end
    if search[:gender]
      unless search[:gender].eql? 'All'
        conditions += if conditions == ''
                        "gender like '#{search[:gender]}'"
                      else
                        " AND gender like '#{search[:gender]}'"
                      end
      end
    end
    if search[:blood_group]
      if conditions == ''
        conditions += "blood_group like '#{search[:blood_group]}'" \
        unless search[:blood_group] == ''
      else
        conditions += " AND blood_group like '#{search[:blood_group]}'" \
        unless search[:blood_group] == ''
      end
    end
    if search[:country_id]
      if conditions == ''
        conditions += "nationality_id ='#{search[:country_id]}'" \
        unless search[:country_id] == ''
      else
        conditions += " AND nationality_id ='#{search[:country_id]}'" \
        unless search[:country_id] == ''
      end
    end
    if search[:admission_date]
      if conditions == ''
        conditions += "admission_date ='#{search[:admission_date]}'" \
        unless search[:admission_date] == ''
      else
        conditions += " AND admission_date ='#{search[:admission_date]}'" \
        unless search[:admission_date] == ''
      end
    end
    if search[:date_of_birth]
      if conditions == ''
        conditions += "date_of_birth = '#{search[:date_of_birth]}'" \
        unless search[:date_of_birth] == ''
      else
        conditions += " AND date_of_birth = '#{search[:date_of_birth]}'" \
        unless search[:date_of_birth] == ''
      end
    end
    if search[:status]
      if search[:status] == 'all'
        std1 = Student.where(conditions)
        std2 = ArchivedStudent.where(conditions)
        std1 + std2
      elsif search[:status] == 'present'
        Student.where(conditions)
      else
        ArchivedStudent.where(conditions)
      end
    end
  end

  # Method for search student and return criteria for searching,
  # when user search upon muitiple criteria thoes criteria return
  # by search script and return script result
  def self.search_script(search, batch)
    script = ''
    script += ' Name: ' + search[:name].to_s + ', ' \
    unless search[:name].empty?
    if search[:course_id].present?
      course = Course.find(search[:course_id])
      script += ' Course: ' + course.course_name + ', ' unless course.nil?
    end
    if batch[:id].present?
      batch = Batch.find(batch[:id])
      script += ' Batch: ' + batch.name + ', ' unless batch.nil?
    end
    if search[:category_id].present?
      script += ' Category: ' + Category.find(search[:category_id]).name + ', '
    end
    if search[:gender] == 'All'
      script += ' Gender: All' + ', '
    else
      script += ' Gender: ' + search[:gender].to_s + ', ' \
      unless search[:gender].empty?
    end
    script += ' Blood group: ' + search[:blood_group].to_s + ', ' \
    unless search[:blood_group].empty?
    if search[:country_id].present?
      script += ' Country: ' + Country.find(search[:country_id]).name + ', '
    end
    script += ' Admission date: ' + search[:admission_date].to_s + ', ' \
    unless search[:admission_date].empty?
    script += ' Date of birth: ' + search[:date_of_birth].to_s + ', ' \
    unless search[:date_of_birth].empty?
    script += if search[:status] == 'present'
                ' Present student'
              elsif search[:status] == 'former'
                ' Former student'
              else
                ' All student'
              end
    script
  end



  COLUMNS_TO_STRING = ["batch_id", "class_roll_no","phone1","phone2"] # and so on


def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    row = clean_for row, COLUMNS_TO_STRING
    record = Student.find_by(:batch_id => row["batch_id"],:class_roll_no => row["class_roll_no"],:phone1 => row["phone1"],:phone2 => row["phone2"]) || new
    record.attributes = row.to_hash.slice(*row.to_hash.keys)
    record.save!
  end
end

def self.clean_for row_as_hash, string_columns_array
  row_as_hash.each do |key, value|
    if string_columns_array.include?key
      row_as_hash[key] = value.to_i.to_s
    end
  end
end



def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::CSV.new(file.path)
  when ".xls" then Roo::Excel.new(file.path)
  when ".xlsx" then Roo::Excelx.new(file.path)
  else raise "Unknown file type: #{file.original_filename}"
  end
end



  # This method for send mail to user
  def student_email(subject, recipient, message)
    user = User.discover(id, recipient)
    UserMailer.student_email(user, subject, message).deliver
  end

  # Fetch the record from student according to selected exam and student.
  def exam_scores(exam)
    ExamScore.where(exam_id: exam, student_id: id).take
  end

  HUMANIZED_ATTRIBUTES = {
    email: 'Email Address',
    phone1: 'Phone number',
    phone2: 'Mobile number'
  }.freeze

  private

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def create_user_account
    user = User.new do |u|
      u.first_name = first_name
      u.last_name = last_name
      u.username = email
      u.student_id = id
      u.password = admission_no
      u.role = 'Student'
      u.email = email
      u.general_setting_id = if User.current
                               User.current.general_setting_id
                             else
                               1
                             end
    end
    user.save
  end
end
