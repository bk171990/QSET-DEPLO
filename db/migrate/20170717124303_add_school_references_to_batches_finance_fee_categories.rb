class AddSchoolReferencesToBatchesFinanceFeeCategories < ActiveRecord::Migration
  def change
    add_reference :batches_finance_fee_categories, :school, index: true, foreign_key: true
  end
end
