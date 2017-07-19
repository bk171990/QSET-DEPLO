class School < ActiveRecord::Base
	after_save :create_user_account
  has_many :students
  has_many :batches
  has_many :finance_transaction_users
  has_many :finance_transactions
  has_many :courses
  has_many :employees
  has_many :time_tables
  has_many :question_databases
  has_many :placement_news
  has_many :categories
  has_one :user
  has_many :reports
  has_many :events
  has_many :companies
  has_many :finance_donations
  has_many :employee_departments
  has_many :placement_exams
  has_many :newscasts
  has_many :assets
  has_many :subjects
  has_many :finance_fee_categories
  has_many :question_types
  has_many :bank_fields
  has_many :payroll_categories
  has_many :finance_fee_collections
  has_many :class_timings
  has_many :class_designations
  has_many :grading_levels
  has_many :ranking_levels
  has_many :finance_transaction_triggers
  has_many :finance_transaction_categories
  validates :first_name, presence: true
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
        username: self.username,
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