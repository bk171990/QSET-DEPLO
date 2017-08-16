class School < ActiveRecord::Base
	after_save :create_user_account
  has_many :students, dependent: :destroy
  has_many :batches, dependent: :destroy
  has_many :monthly_payslips, dependent: :destroy
  has_many :finance_transactions, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :liabilities, dependent: :destroy
  has_many :attendences, dependent: :destroy
  has_many :employee_attendances, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :time_tables, dependent: :destroy
  has_many :question_databases, dependent: :destroy
  has_many :employee_leave_types, dependent: :destroy
  has_many :employee_positions, dependent: :destroy
  has_many :placement_news, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :employee_categories, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :newscasts, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :employee_leaves,dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :finance_donations, dependent: :destroy
  has_many :employee_departments, dependent: :destroy
  has_many :employee_grades, dependent: :destroy
  has_many :placement_exams, dependent: :destroy
  has_many :newscasts, dependent: :destroy
  has_many :assets, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :finance_fee_categories, dependent: :destroy
  has_many :question_types, dependent: :destroy
  has_many :bank_fields, dependent: :destroy
  has_many :payroll_categories, dependent: :destroy
  has_many :finance_fee_collections, dependent: :destroy
  has_many :class_timings, dependent: :destroy
  has_many :class_designations, dependent: :destroy
  has_many :grading_levels, dependent: :destroy
  has_many :ranking_levels, dependent: :destroy
  has_many :finance_transaction_triggers, dependent: :destroy
  has_many :finance_transaction_categories, dependent: :destroy
  validates :name, presence: true
  scope :shod, ->(id) { where(id: id).take }

  def self.set_password
    date = Date.today.strftime('%Y%m%d')
    if School.first.nil?
      'A' + date.to_s + '1'
    else
      last_id = School.last.id.next
      'A' + date.to_s + last_id.to_s
    end
  end

  def create_user_account
	     User.create!(
        username: self.email,
        password: self.password,
        email: self.email,
        first_name: self.name,
        last_name: self.organization,
        role: 'Admin',
        school_id: id,
        general_setting_id: if User.current
                               User.current.general_setting_id
                             else
                               1
                             end)
  end
end