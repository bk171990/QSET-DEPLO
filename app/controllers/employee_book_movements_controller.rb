class EmployeeBookMovementsController < ApplicationController

  def new
    @issue_book = EmployeeBookMovement.new
    @employee = Employee.shod(params[:format])
    @interval = LibrarySetting.last.interval
  end

  def book
    @books = Book.status
  end

  def issued_index
    @issue_books = EmployeeBookMovement.all
    @employee = Employee.find(params[:id])
    @issue_books = @employee.employee_book_movements
  end

  def edit
    @issue_book = EmployeeBookMovement.find(params[:id])
    @book = @issue_book.book
    @employee = @issue_book.employee
    @interval = LibrarySetting.last.interval
  end

  def update
    @issue_book = EmployeeBookMovement.find(params[:id])
    @issue_book.update(issue_params)
    flash[:notice] = 'Successfully Renewed'
    redirect_to search_all_student_book_movements_path
  end

  def return_book
    @issue_book = EmployeeBookMovement.find(params[:id])
  end

  def create
    @issue_books = EmployeeBookMovement.includes("book_id").where(employee_id: params[:employee_id]).count
     if @issue_books < 3
       ids = []
       params[:book_ids].each do |book_id|
       if Book.find(book_id.to_i)
        if ids.length < 3
         ids << book_id   
        end
         employee_id = params[:employee_id]
         @issue_books = EmployeeBookMovement.find_or_initialize_by(book_id: book_id.to_i,employee_id: employee_id.to_i)
         @issue_books.issue_date = params[:employee_book_movement][:issue_date]
         @issue_books.due_date = params[:employee_book_movement][:due_date]
         @issue_books.library_setting_id = params[:employee_book_movement][:library_setting_id]
         @issue_books.save
         a = LibrarySetting.last
         EmployeeBookMovement.update_all(:library_setting_id =>a)
         book = EmployeeBookMovement.last.book.id
         Book.update(book,:status =>'Issued')
        end  
       end
        redirect_to search_student_book_movements_path
     else
        flash[:notice] = 'Cannot Issue More then 3'
    end
   end

   def create_return_book
    binding.pry
     return_book_present = params[:employee_book_movement_id] &&  params[:employee_id] && params[:book_id].present?
     @return_book = ReturnBook.find_or_create_by(employee_book_movement_id: params[:employee_book_movement_id],employee_id: params[:employee_id], book_id: params[:book_id])
     @return_book.save
     @return_book.update(is_return: true)
     @issue_book = EmployeeBookMovement.find(params[:employee_book_movement_id])
     @issue_book_update = @issue_book.book_id
     Book.update(@issue_book_update,:status => 'Available')
     @issue_book.delete
     redirect_to search_all_student_book_movements_path
     flash[:notice] = 'Successfully Return Book'
  end

   private

   def issue_params
      params.require(:employee_book_movement).permit(:issue_date,:due_date,:employee_id,:book_id)
   end
end
