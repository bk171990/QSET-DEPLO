class School < ActiveRecord::Base
	after_save :create_user_account
  has_many :students
  has_many :batches
  has_many :courses
  has_one :user
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