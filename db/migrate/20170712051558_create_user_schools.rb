class CreateUserSchools < ActiveRecord::Migration
  def change
    create_table :user_schools do |t|
      t.references :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
      t.references :user, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
    end
  end
end
