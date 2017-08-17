class AddReferencesSchoolToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
