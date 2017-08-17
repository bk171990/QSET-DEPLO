class AddSchoolReferencesToEmployeeDepartments < ActiveRecord::Migration
  def change
    add_reference :employee_departments, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
