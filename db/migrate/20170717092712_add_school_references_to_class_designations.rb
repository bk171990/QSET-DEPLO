class AddSchoolReferencesToClassDesignations < ActiveRecord::Migration
  def change
    add_reference :class_designations, :school, index: true, foreign_key: true
  end
end
