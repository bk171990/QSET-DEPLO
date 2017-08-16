# EmployeeDepartmentEvent model
class EmployeeDepartmentEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :employee_department
  belongs_to :school
end
