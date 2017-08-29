class CreateLibrarySettings < ActiveRecord::Migration
  def change
    create_table :library_settings do |t|
      t.integer :interval

      t.timestamps null: false
    end
  end
end
