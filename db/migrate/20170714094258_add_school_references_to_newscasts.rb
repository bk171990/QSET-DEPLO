class AddSchoolReferencesToNewscasts < ActiveRecord::Migration
  def change
    add_reference :newscasts, :school, index: true, foreign_key: true
  end
end
