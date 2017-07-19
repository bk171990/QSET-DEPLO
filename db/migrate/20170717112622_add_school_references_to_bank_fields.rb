class AddSchoolReferencesToBankFields < ActiveRecord::Migration
  def change
    add_reference :bank_fields, :school, index: true, foreign_key: true
  end
end
