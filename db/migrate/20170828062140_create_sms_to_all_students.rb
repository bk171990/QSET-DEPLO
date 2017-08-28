class CreateSmsToAllStudents < ActiveRecord::Migration
  def change
    create_table :sms_to_all_students do |t|
      t.string :body
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
