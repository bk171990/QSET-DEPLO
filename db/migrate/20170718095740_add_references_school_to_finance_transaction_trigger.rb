class AddReferencesSchoolToFinanceTransactionTrigger < ActiveRecord::Migration
  def change
    add_reference :finance_transaction_triggers, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
