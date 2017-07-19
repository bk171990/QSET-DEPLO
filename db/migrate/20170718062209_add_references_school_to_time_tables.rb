class AddReferencesSchoolToTimeTables < ActiveRecord::Migration
  def change
    add_reference :time_tables, :school, index: true, foreign_key: true
  end
end
