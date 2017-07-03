class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.date :purchase_date
      t.string :claim_item
      t.string :claim_quantity
      t.string :comment
      t.boolean :is_published, default: false
      t.boolean :result_published, default: false
      t.references :batch, index: true, foreign_key: true
      t.boolean :option1 
      t.boolean :option2
      t.string :remaining_quantity

      t.timestamps null: false
    end
  end
end