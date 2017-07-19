class AddReferencesSchoolToPlacementNews < ActiveRecord::Migration
  def change
    add_reference :placement_news, :school, index: true, foreign_key: true
  end
end
