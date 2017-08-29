class AddColumnBookReferenceToReturnBooks < ActiveRecord::Migration
  def change
    add_reference :return_books, :book, index: true, foreign_key: true
  end
end
