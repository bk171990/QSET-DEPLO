class BulkEmployeeEmail < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_department
end
