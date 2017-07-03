class AddDateFieldToInventoryStoreItems < ActiveRecord::Migration
  def change
    add_column :inventory_store_items, :date, :date
  end
end
