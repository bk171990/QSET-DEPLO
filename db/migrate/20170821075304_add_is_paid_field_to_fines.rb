class AddIsPaidFieldToFines < ActiveRecord::Migration
  def change
    add_column :fines, :is_paid, :boolean
  end
end
