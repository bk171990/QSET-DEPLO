class AddReferencesSchoolToArchivedStudent < ActiveRecord::Migration
  def change
    add_reference :archived_students, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
