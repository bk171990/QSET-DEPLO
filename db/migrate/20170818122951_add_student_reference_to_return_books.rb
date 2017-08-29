class AddStudentReferenceToReturnBooks < ActiveRecord::Migration
  def change
    add_reference :return_books, :student, index: true, foreign_key: true
  end
end
