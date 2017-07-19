class AddSchoolReferencesToFeeDiscounts < ActiveRecord::Migration
  def change
    add_reference :fee_discounts, :school, index: true, foreign_key: true
  end
end
