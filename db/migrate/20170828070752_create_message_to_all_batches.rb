class CreateMessageToAllBatches < ActiveRecord::Migration
  def change
    create_table :message_to_all_batches do |t|
      t.string :body
      t.references :batch, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
