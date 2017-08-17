class AddSchoolReferencesToGeneralSettings < ActiveRecord::Migration
  def change
    add_reference :general_settings, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
