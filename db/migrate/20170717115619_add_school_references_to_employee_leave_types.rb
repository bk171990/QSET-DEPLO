class AddSchoolReferencesToEmployeeLeaveTypes < ActiveRecord::Migration
  def change
    add_reference :employee_leave_types, :school, index: true, foreign_key: true
  end
end
