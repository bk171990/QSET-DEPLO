class AddReferencesSchoolToPlacementExams < ActiveRecord::Migration
  def change
    add_reference :placement_exams, :school, index: true, foreign_key: true
  end
end
