class CreateIdenCards < ActiveRecord::Migration
  def change
    create_table :iden_cards do |t|
      t.string :description
      t.references :student, index: true, foreign_key: true
      t.references :batch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
