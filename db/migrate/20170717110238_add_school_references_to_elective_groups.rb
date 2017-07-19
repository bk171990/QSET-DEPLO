class AddSchoolReferencesToElectiveGroups < ActiveRecord::Migration
  def change
    add_reference :elective_groups, :school, index: true, foreign_key: true
  end
end
