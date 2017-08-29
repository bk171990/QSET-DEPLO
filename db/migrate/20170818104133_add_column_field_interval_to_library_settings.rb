class AddColumnFieldIntervalToLibrarySettings < ActiveRecord::Migration
  def change
    add_column :library_settings, :interval, :integer
  end
end
