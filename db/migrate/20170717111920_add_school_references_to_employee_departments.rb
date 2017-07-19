class AddSchoolReferencesToEmployeeDepartments < ActiveRecord::Migration
  def change
    add_reference :employee_departments, :school, index: true, foreign_key: true
  end
end
