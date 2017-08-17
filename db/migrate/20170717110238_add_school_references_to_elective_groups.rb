class AddSchoolReferencesToElectiveGroups < ActiveRecord::Migration
  def change
    add_reference :elective_groups, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
