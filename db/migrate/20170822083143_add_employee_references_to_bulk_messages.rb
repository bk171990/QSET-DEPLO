class AddEmployeeReferencesToBulkMessages < ActiveRecord::Migration
  def change
    add_reference :bulk_messages, :employee, index: true, foreign_key: true
  end
end
