class AddSchoolReferencesToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :school, index: true, foreign_key: true
  end
end
