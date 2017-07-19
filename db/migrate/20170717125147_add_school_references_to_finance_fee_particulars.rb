class AddSchoolReferencesToFinanceFeeParticulars < ActiveRecord::Migration
  def change
    add_reference :finance_fee_particulars, :school, index: true, foreign_key: true
  end
end
