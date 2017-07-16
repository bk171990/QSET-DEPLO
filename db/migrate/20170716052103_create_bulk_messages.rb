class CreateBulkMessages < ActiveRecord::Migration
  def change
    create_table :bulk_messages do |t|
      t.string :type
      t.string :body

      t.timestamps null: false
    end
  end
end
