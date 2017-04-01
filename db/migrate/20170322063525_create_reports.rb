class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :model
      t.references :student, index: true, foreign_key: true
      t.references :guardian, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
