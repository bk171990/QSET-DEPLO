class AddTotalFieldToInventoryStoreItems < ActiveRecord::Migration
  def change
    add_column :inventory_store_items, :total, :string
  end
end
