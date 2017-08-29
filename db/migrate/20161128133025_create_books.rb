class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :book_category, index: true
      t.string :title
      t.string :author
      t.string :book_number
      t.string :status, :default=>'Available'
      t.string :publisher
    end
  end
end
