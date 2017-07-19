class AddReferencesSchoolToAttendences < ActiveRecord::Migration
  def change
    add_reference :attendences, :school, index: true, foreign_key: true
  end
end
