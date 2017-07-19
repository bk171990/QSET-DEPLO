class AddSchoolReferencesToFinanceFeeCollection < ActiveRecord::Migration
  def change
    add_reference :finance_fee_collections, :school, index: true, foreign_key: true
  end
end
