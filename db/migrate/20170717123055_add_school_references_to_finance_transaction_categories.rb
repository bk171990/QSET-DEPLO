class AddSchoolReferencesToFinanceTransactionCategories < ActiveRecord::Migration
  def change
    add_reference :finance_transaction_categories, :school, index: true, foreign_key: true
  end
end
