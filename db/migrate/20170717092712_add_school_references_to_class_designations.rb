class AddSchoolReferencesToClassDesignations < ActiveRecord::Migration
  def change
    add_reference :class_designations, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
