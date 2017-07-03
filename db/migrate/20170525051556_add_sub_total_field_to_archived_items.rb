class AddSubTotalFieldToArchivedItems < ActiveRecord::Migration
  def change
    add_column :archived_items, :subtotal, :string
  end
end
