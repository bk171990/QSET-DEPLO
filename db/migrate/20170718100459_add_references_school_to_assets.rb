class AddReferencesSchoolToAssets < ActiveRecord::Migration
  def change
    add_reference :assets, :school, index: true, foreign_key: true
  end
end
