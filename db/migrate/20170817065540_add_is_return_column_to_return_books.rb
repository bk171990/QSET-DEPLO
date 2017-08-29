class AddIsReturnColumnToReturnBooks < ActiveRecord::Migration
  def change
    add_column :return_books, :is_return, :boolean
  end
end
