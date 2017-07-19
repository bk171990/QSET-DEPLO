class AddReferencesSchoolToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :school, index: true, foreign_key: true
  end
end
