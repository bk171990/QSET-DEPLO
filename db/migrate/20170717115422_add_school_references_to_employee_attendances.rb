class AddSchoolReferencesToEmployeeAttendances < ActiveRecord::Migration
  def change
    add_reference :employee_attendances, :school, index: true, foreign_key: true
  end
end
