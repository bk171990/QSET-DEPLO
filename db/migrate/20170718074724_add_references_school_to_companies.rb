class AddReferencesSchoolToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
