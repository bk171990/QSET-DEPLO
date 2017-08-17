class AddSchoolReferencesToRankingLevels < ActiveRecord::Migration
  def change
    add_reference :ranking_levels, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
