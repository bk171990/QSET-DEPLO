class AddColumnBookReferenceToFines < ActiveRecord::Migration
  def change
    add_reference :fines, :book, index: true, foreign_key: true
  end
end
