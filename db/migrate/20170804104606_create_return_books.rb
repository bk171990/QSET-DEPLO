class CreateReturnBooks < ActiveRecord::Migration
  def change
    create_table :return_books do |t|
      t.references :book_movement, index: true, foreign_key: true,foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
