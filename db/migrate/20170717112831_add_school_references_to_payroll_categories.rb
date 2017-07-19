class AddSchoolReferencesToPayrollCategories < ActiveRecord::Migration
  def change
    add_reference :payroll_categories, :school, index: true, foreign_key: true
  end
end
