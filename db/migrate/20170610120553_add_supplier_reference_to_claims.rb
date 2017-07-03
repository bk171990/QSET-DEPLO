class AddSupplierReferenceToClaims < ActiveRecord::Migration
  def change
    add_reference :claims, :supplier, index: true, foreign_key: true
  end
end
