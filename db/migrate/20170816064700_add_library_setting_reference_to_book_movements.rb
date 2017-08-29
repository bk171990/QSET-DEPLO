class AddLibrarySettingReferenceToBookMovements < ActiveRecord::Migration
  def change
    add_reference :book_movements, :library_setting, index: true, foreign_key: true
  end
end
