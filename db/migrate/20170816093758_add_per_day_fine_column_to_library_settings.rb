class AddPerDayFineColumnToLibrarySettings < ActiveRecord::Migration
  def change
    add_column :library_settings, :per_day_fine, :integer
  end
end
