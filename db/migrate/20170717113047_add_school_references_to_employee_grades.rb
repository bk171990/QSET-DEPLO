class AddSchoolReferencesToEmployeeGrades < ActiveRecord::Migration
  def change
    add_reference :employee_grades, :school, index: true, foreign_key: true
  end
end
