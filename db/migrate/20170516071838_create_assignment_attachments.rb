class CreateAssignmentAttachments < ActiveRecord::Migration
  def change
    create_table :assignment_attachments do |t|
      t.references :assignment, index: true, foreign_key: true
      t.string :file

      t.timestamps null: false
    end
  end
end
