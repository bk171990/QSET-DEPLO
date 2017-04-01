# Guardian model
class Guardian < ActiveRecord::Base
  belongs_to :country
  belongs_to :student
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }, allow_blank: true
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates_length_of :first_name, minimum: 1, maximum: 20

  validates :last_name, presence: true, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }
  validates_length_of :last_name, minimum: 1, maximum: 20

  validates :relation, presence: true, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }
  validates_length_of :relation, minimum: 1, maximum: 20
  validates :country_id, presence: true
  validates :office_phone1, presence: true, numericality: { only_integer: true }, length: { minimum: 6, maximum: 11 }, allow_blank: true
  validates :office_phone2, numericality: { only_integer: true }, length: { minimum: 6, maximum: 11 }, allow_blank: true
  validates :office_address_line1, length: { in: 1..20 }, allow_blank: true
  validates :office_address_line2, length: { in: 1..20 }, allow_blank: true
  validates :city, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }, length: { in: 1..20 }, allow_blank: true
  validates :occupation, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' }, length: { in: 1..20 }, allow_blank: true
  validates :income, numericality: { only_integer: true }, length: { in: 1..10 }, allow_blank: true
  validates :education, format: { with: /\A[a-z A-Z]+\z/, message: 'only allows letters' },
                        length: { in: 1..20 }, allow_blank: true
  scope :shod, ->(id) { where(id: id).take }
  scope :discover, ->(s, r) { where(student_id: s, relation: r).take }

  # return full student name by joining first name and last name
  def student_name
    [first_name, last_name].join(' ')
  end
    
COLUMNS_TO_STRING = ["student_id"]  # and so on
  
def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    row = clean_for row, COLUMNS_TO_STRING
    guardian = Guardian.find_by(:student_id => row["student_id"]) || new
    guardian.attributes = row.to_hash.slice(*row.to_hash.keys)
    guardian.save!
  end
 end
 
def self.clean_for row_as_hash, string_columns_array
  row_as_hash.each do |key, value|
    if string_columns_array.include?key
      row_as_hash[key] = value.to_i.to_s
    end
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


  # This action create the user account for parent for selected student.
  def create_user_account
    user = User.new do |u|
      u.first_name = first_name
      u.last_name = last_name
      u.username = email
      u.student_id = student.id
      u.password = 'P' + student.admission_no
      u.role = 'Parent'
      u.email = email
      u.general_setting_id =  User.current.general_setting.id
    end
    user.save
    p user.errors
  end

  private

  HUMANIZED_ATTRIBUTES = {
    email: 'Email Address',
    office_phone1: 'Contact number',
    office_phone2: 'Office phone number'
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
