class AddDateFieldColumnToFines < ActiveRecord::Migration
  def change
    add_column :fines, :date, :date
  end
end
