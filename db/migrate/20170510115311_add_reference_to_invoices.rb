class AddReferenceToInvoices < ActiveRecord::Migration
  def change
    add_reference :invoices, :batch, index: true, foreign_key: true
  end
end
