class AddReferencesToBulkMessages < ActiveRecord::Migration
  def change
    add_reference :bulk_messages, :student, index: true, foreign_key: true
    add_reference :bulk_messages, :batch, index: true, foreign_key: true
  end
end
