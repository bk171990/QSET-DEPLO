class AddSchoolReferencesToSubjects < ActiveRecord::Migration
  def change
    add_reference :subjects, :school, index: true, foreign_key: true
  end
end
