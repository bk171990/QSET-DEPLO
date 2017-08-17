class AddSchoolReferencesToGradingLevels < ActiveRecord::Migration
  def change
    add_reference :grading_levels, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
