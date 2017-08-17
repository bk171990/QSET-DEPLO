class AddSchoolReferencesToFeeDiscounts < ActiveRecord::Migration
  def change
    add_reference :fee_discounts, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
