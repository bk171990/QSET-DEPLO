class AddReferencesSchoolToFinanceTransactions < ActiveRecord::Migration
  def change
    add_reference :finance_transactions, :school, index: true, foreign_key: true
  end
end
