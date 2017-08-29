class CreateFineCollections < ActiveRecord::Migration
  def change
    create_table :fine_collections do |t|
      t.date :start_date
      t.date :end_date
      t.references :student, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.references :fine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
