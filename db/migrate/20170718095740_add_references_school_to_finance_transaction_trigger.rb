class AddReferencesSchoolToFinanceTransactionTrigger < ActiveRecord::Migration
  def change
    add_reference :finance_transaction_triggers, :school, index: true, foreign_key: true
  end
end
