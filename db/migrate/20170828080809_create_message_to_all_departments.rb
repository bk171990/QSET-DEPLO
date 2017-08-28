class CreateMessageToAllDepartments < ActiveRecord::Migration
  def change
    create_table :message_to_all_departments do |t|
      t.string :body
      t.references :employee_department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
