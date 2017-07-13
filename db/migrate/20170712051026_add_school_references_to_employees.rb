class AddSchoolReferencesToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :school, index: true, foreign_key: true
  end
end
