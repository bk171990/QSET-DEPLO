class CreateBookMovements < ActiveRecord::Migration
  def change
    create_table :book_movements do |t|
      t.date :issue_date
      t.date :due_date
      t.references :book, index: true
      t.references :student, index: true
      t.string :book_information
      t.timestamps null: false
    end
  end
end
