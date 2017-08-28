class CreateSmsToAllEmployees < ActiveRecord::Migration
  def change
    create_table :sms_to_all_employees do |t|
      t.string :body
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
