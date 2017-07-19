class AddSchoolReferencesToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :school, index: true, foreign_key: true
  end
end
