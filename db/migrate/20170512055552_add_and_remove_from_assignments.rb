class AddAndRemoveFromAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :file_filename, :string
    add_column :assignments, :file_content_type, :string
    add_column :assignments, :file_data, :string
    add_column :assignments, :file_file_size, :integer
    add_column :assignments, :file_updated_at, :datetime
  end
end
