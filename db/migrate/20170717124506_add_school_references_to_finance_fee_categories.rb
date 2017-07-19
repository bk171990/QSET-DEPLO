class AddSchoolReferencesToFinanceFeeCategories < ActiveRecord::Migration
  def change
    add_reference :finance_fee_categories, :school, index: true, foreign_key: true
  end
end
