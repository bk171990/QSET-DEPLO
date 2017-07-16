class AddStudentReferencesToBulkMessages < ActiveRecord::Migration
  def change
    add_reference :bulk_messages, :student, index: true, foreign_key: true
  end
end
