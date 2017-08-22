class CreateBulkMessageEmployees < ActiveRecord::Migration
  def change
    create_table :bulk_message_employees do |t|
      t.string :body
      t.references :employee, index: true, foreign_key: true
      t.references :employee_department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
