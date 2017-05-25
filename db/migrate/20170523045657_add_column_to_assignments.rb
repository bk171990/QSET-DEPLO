class AddColumnToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :assignment_subject, :string
  end
end
