class EmployeeBookMovement < ActiveRecord::Base
  belongs_to :employee
  belongs_to :book
  has_many :return_books ,dependent: :destroy
end
