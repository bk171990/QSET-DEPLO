class AddTotalFineColumnFieldToFines < ActiveRecord::Migration
  def change
    add_column :fines, :total_fine, :string
  end
end
