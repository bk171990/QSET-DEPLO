class AddCategoryFieldToInventoryStoreItems < ActiveRecord::Migration
  def change
    add_column :inventory_store_items, :category, :string
  end
end
