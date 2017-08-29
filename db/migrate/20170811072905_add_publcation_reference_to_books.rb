class AddPublcationReferenceToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :publication, index: true, foreign_key: true
  end
end
