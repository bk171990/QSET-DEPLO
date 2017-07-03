class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :contact_no
      t.string :address
      t.string :pin_no
      t.string :region
      t.string :help_desk
      t.timestamps null: false
    end
  end
end
