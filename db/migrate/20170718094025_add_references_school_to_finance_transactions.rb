class AddReferencesSchoolToFinanceTransactions < ActiveRecord::Migration
  def change
    add_reference :finance_transactions, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
