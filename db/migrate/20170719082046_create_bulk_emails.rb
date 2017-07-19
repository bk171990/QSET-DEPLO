class CreateBulkEmails < ActiveRecord::Migration
  def change
    create_table :bulk_emails do |t|
      t.string :subject
      t.string :email_body

      t.timestamps null: false
    end
  end
end
