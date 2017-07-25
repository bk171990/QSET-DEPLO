class AddScoolReferencesToGuardians < ActiveRecord::Migration
  def change
    add_reference :guardians, :school, index: true, foreign_key: true
  end
end
