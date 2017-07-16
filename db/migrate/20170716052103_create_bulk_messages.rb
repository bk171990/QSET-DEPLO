class CreateBulkMessages < ActiveRecord::Migration
  def change
    create_table :bulk_messages do |t|
      t.string :message_type
      t.string :body
      t.string :email_body
      t.string :email
      t.string :subject

      t.timestamps null: false
    end
  end
end