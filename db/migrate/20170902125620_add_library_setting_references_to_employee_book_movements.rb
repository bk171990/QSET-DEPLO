class AddLibrarySettingReferencesToEmployeeBookMovements < ActiveRecord::Migration
  def change
    add_reference :employee_book_movements, :library_setting, index: true, foreign_key: true
  end
end
