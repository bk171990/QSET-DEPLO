class AddColumnFieldToBookMovements < ActiveRecord::Migration
  def change
    add_column :book_movements, :nature, :boolean
  end
end
