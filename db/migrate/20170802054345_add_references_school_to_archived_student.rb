class AddReferencesSchoolToArchivedStudent < ActiveRecord::Migration
  def change
    add_reference :archived_students, :school, index: true, foreign_key: true
  end
end
