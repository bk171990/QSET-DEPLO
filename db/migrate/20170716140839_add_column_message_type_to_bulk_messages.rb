class AddColumnMessageTypeToBulkMessages < ActiveRecord::Migration
  def change
    add_column :bulk_messages, :message_type, :string
  end
end
