class CreateInventoryStoreItems < ActiveRecord::Migration
  def change
    create_table :inventory_store_items do |t|
      t.string :item_name
      t.string :code
      t.string :quantity
      t.string :unit_price
      t.string :tax
      t.string :batch_no
      t.string :invoice_grand_total

      t.timestamps null: false
    end
  end
end