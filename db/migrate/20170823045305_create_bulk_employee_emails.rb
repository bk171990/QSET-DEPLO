class CreateBulkEmployeeEmails < ActiveRecord::Migration
  def change
    create_table :bulk_employee_emails do |t|
      t.string :subject
      t.string :body
      t.references :employee, index: true, foreign_key: true
      t.references :employee_department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
