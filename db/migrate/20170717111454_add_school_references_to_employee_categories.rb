class AddSchoolReferencesToEmployeeCategories < ActiveRecord::Migration
  def change
    add_reference :employee_categories, :school, index: true, foreign_key: true
  end
end
