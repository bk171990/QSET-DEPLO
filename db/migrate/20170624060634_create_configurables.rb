class CreateConfigurables < ActiveRecord::Migration
  def change
    create_table :configurables do |t|
      t.boolean :select
      t.string :name_tag

      t.timestamps null: false
    end
  end
end
