class CreateEmployeeBookMovements < ActiveRecord::Migration
  def change
    create_table :employee_book_movements do |t|
      t.date :issue_date
      t.date :due_date
      t.references :employee, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
