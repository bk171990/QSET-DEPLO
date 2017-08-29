class CreateFines < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.string :amount
      t.references :book_movement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
