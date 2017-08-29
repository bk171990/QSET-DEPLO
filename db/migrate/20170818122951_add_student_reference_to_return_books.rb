class AddStudentReferenceToReturnBooks < ActiveRecord::Migration
  def change
    add_reference :return_books, :student, index: true, foreign_key: true
    add_column :return_books, :student, :integer
  end
end
