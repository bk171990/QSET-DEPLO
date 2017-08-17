class AddScoolReferencesToGuardians < ActiveRecord::Migration
  def change
    add_reference :guardians, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
