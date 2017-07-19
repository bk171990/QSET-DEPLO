class AddSchoolReferencesToWeekdays < ActiveRecord::Migration
  def change
    add_reference :weekdays, :school, index: true, foreign_key: true
  end
end
