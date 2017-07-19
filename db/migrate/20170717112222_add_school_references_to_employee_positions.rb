class AddSchoolReferencesToEmployeePositions < ActiveRecord::Migration
  def change
    add_reference :employee_positions, :school, index: true, foreign_key: true
  end
end
