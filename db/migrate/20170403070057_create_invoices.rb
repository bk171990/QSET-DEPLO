class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :issued_to
      t.references :student, index: true, foreign_key: true
      t.references :guardian, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.references :inventory_store_item, index: true, foreign_key: true
      t.string :total
      t.string :sub_total
      t.string :tax
      t.boolean :is_paid
      t.string :date

      t.timestamps null: false
    end
  end
end
