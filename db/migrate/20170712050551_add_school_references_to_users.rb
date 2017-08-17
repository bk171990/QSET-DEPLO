class AddSchoolReferencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
