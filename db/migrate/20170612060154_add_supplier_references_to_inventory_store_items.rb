class AddSupplierReferencesToInventoryStoreItems < ActiveRecord::Migration
  def change
    add_reference :inventory_store_items, :supplier,\
     index: true, foreign_key: true
  end
end
