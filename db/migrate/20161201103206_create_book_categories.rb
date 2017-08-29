class CreateBookCategories < ActiveRecord::Migration
  def change
    create_table :book_categories do |t|
      t.string :barcode
      t.string :book_type

      t.timestamps null: false
    end
  end
end
