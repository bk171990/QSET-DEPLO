class AddReferenceToInventoryStoreItems < ActiveRecord::Migration
  def change
    add_reference :inventory_store_items, :batch, index: true, foreign_key: true
  end
end
