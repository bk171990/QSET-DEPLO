class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :contact
      t.string :email
      t.string :address
      t.string :organization

      t.timestamps null: false
    end
  end
end
