class AddSchoolReferencesToGradingLevels < ActiveRecord::Migration
  def change
    add_reference :grading_levels, :school, index: true, foreign_key: true
  end
end
