class CreateUserSchools < ActiveRecord::Migration
  def change
    create_table :user_schools do |t|
      t.references :school, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
