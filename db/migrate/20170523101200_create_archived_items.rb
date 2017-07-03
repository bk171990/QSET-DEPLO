class CreateArchivedItems < ActiveRecord::Migration
  def change
    create_table :archived_items do |t|
      t.string :item_name
      t.string :quantity
      t.string :unit_price
      t.string :category
      t.date :date
      t.string :mrp
      t.string :total
      t.string :option
      t.string :status_description
      t.string :return_qty
      t.string :invoice_grand_total
      t.string :return_total
      t.string :remainig_qty
      t.string :return_quantity
      t.references :supplier, index: true, foreign_key: true
      t.references :batch, index: true, foreign_key: true
      t.references :inventory_store_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end


