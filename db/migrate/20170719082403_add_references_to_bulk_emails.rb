class AddReferencesToBulkEmails < ActiveRecord::Migration
  def change
    add_reference :bulk_emails, :student, index: true, foreign_key: true
    add_reference :bulk_emails, :batch, index: true, foreign_key: true
  end
end
