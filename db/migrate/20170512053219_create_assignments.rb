class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :content
      t.string :file
      t.string :file_file_name
      t.date :due_date
      t.references :subject, index: true, foreign_key: true
      t.references :batch, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
