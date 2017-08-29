class AddStudentReferenceToFines < ActiveRecord::Migration
  def change
    add_reference :fines, :student, index: true, foreign_key: true
  end
end
