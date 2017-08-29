class FinesController < ApplicationController

  def index
    @fines = Fine.all
  end

  def search_student
  	@students = Student.search_all(params[:search])
  end

  def pay_fine
  	@dibs = BookMovement.all
  	@book_movement = BookMovement.shod(params[:format])
  	@student = Student.find(params[:id])
    @dibs = @student.book_movements
  end

  def student_fine
  	@dib = BookMovement.find(params[:id])
  end

  def pay_amount
  	binding.pry
     book_movement_present = params[:student_id] &&  params[:book_movement_id] && params[:book_id].present? 
    @fine = Fine.find_or_initialize_by(book_movement_id: params[:book_movement_id], student_id: params[:student_id], book_id: params[:book_id])
    @fine.save
    @book_movement = BookMovement.find(params[:book_movement_id])
    @update_fine = @book_movement.fine
    @book_movement.fines.update_all(:amount => @update_fine,is_paid: true)
    paid = @fine.is_paid.present?
    @book_movement = BookMovement.find(params[:book_movement_id]) 
    @paidamount = @book_movement.fine
    @book_movement.update(fine: 0)
    redirect_to search_student_fines_path
  end
end
