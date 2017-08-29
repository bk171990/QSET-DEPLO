class AddEmployeeBookMovementReferenceToReturnBooks < ActiveRecord::Migration
  def change
    add_reference :return_books, :employee_book_movement, index: true, foreign_key: true
  end
end
