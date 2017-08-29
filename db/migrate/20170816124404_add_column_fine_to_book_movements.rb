class AddColumnFineToBookMovements < ActiveRecord::Migration
  def change
    add_column :book_movements, :fine, :integer
  end
end
