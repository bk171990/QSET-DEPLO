class AddReferencesSchoolToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :school, index: true, foreign_key: true
  end
end
