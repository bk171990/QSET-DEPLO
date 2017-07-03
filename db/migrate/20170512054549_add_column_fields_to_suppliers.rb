class AddColumnFieldsToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :organization_name, :string
    add_column :suppliers, :email, :string
    add_column :suppliers, :first_name, :string
    add_column :suppliers, :last_name, :string
    add_column :suppliers, :mobile_no, :string
    add_column :suppliers, :address_street1, :string
    add_column :suppliers, :address_street2, :string
    add_column :suppliers, :city, :string
    add_column :suppliers, :postal_zip_code, :string
    add_column :suppliers, :country, :string
    add_column :suppliers, :province_state, :string
  end
end