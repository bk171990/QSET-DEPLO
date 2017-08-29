class BookMovementsController < ApplicationController

  def setting
  end

  def issue_book
    @dib = BookMovement.new
    @book = Book.find(params[:id])
    @batch ||= Batch.all
  end

  def issued_index
    @dibs = BookMovement.all
    @student = Student.find(params[:id])
    @dibs = @student.book_movements
  end

  def load_book_data
    @book = Book.find_by_id(params[:book_ids]).present? ? Book.find(params[:book_ids]) : Book.unscoped.find_by_id(params[:book_ids])
    render :text => [@book.title || ""]
  end

  def index
     @student = Student.shod(params[:format])
    if params[:search]
      @dibs = BookMovement.search(params[:search])
    else
      @dibs = BookMovement.all

    end
  end

  def book
    @books = Book.status
  end

  def show_particular_student_details
    @dibs = BookMovement.all
    @student = @dibs.find(params[:student_id])
  end

  def new
    @dib = BookMovement.new
    @student = Student.shod(params[:format])
    @interval = LibrarySetting.last.interval
  end

  def create
     @dibs = BookMovement.includes("book_id").where(student_id: params[:student_id]).count
     if @dibs < 3
       ids = []
       params[:book_ids].each do |book_id|
       if Book.find(book_id.to_i)
        if ids.length < 3
         ids << book_id   
        end
         student_id = params[:student_id]
         @dibs = BookMovement.find_or_initialize_by(book_id: book_id.to_i,student_id: student_id.to_i)
         @dibs.issue_date = params[:book_movement][:issue_date]
         @dibs.due_date = params[:book_movement][:due_date]
         @dibs.library_setting_id = params[:book_movement][:library_setting_id]
         @dibs.save
         a = LibrarySetting.last
         BookMovement.update_all(:library_setting_id =>a)
         book = BookMovement.last.book.id
         Book.update(book,:status =>'Issued')
        end  
       end
      redirect_to search_student_book_movements_path
     else
     redirect_to search_student_book_movements_path
     flash[:notice] = 'Cannot Issue More then 3'
    end
  end  

  def create_return_book
    return_book_present = params[:book_movement_id] &&  params[:student_id] && params[:book_id].present?
    return_book = ReturnBook.find_or_create_by(book_movement_id: params[:book_movement_id],student_id: params[:student_id], book_id: params[:book_id])
    return_book.save
    return_book.update(is_return: true)
    book_movement = BookMovement.find(params[:book_movement_id])
    book_movement_update = book_movement.book_id
    Book.update(book_movement_update,:status => 'Available')
    book_movement.delete
    redirect_to search_all_student_book_movements_path
    flash[:notice] = 'Successfully Return Book'
  end

   def create_pay_fine
     binding.pry 
    book_movement_present = params[:book_movement_id] &&  params[:book_movement_id].present?
    @fine = Fine.find_or_initialize_by(book_movement_id: params[:book_movement_id])
    @fine.save
    @book_movement = BookMovement.find(params[:book_movement_id])
    @fine = @book_movement.fine
    @book_movement.fines.update_all(:amount => fine,is_paid: true)

    flash[:notice] = 'Successfully Paid Fine'
    redirect_to search_all_student_book_movements_path
  end


  def edit
    @dib = BookMovement.find(params[:id])
    @book = @dib.book
    @student = @dib.student
    @interval = LibrarySetting.last.interval
  end

  def update
    @dib = BookMovement.find(params[:id])
    @dib.update(issue_params)
      flash[:notice] = 'Successfully Renewed'
      redirect_to search_all_student_book_movements_path
  end

  def destroy
     @dib = BookMovement.find(params[:id])
     @dib.delete
     redirect_to book_movements_path
  end


  def return_book
    @dib = BookMovement.find(params[:id])
  end

  def show_student_book_details
    @dib = BookMovement.find(params[:id])
  end

  def book_detail
   @books = Book.all
  end


  def search_student_return_book
    @dibs = BookMovement.search_all(params[:search])
  end

  def search_student
      if params[:nature] =='Student'
        @students = Student.search_all(params[:search])
      else
        @employees = Employee.search2(params[:search])
     end
  end

  def search_student_return_and_renewal
    if params[:nature] == 'Student'
      @students = Student.search_all(params[:search])
    else
     @employees = Employee.search2(params[:search])
    end
  end

  def advanced_student_search
    if params[:student][:option] =='student'
      @students = Student.search(params[:search], 'present')
      puts @students.map{|a| a.id} 
    else
      @employees = Employee.search2(params[:search])
    end
  end

  def show
    @dib = BookMovement.shod(params[:id])
    @student = Student.find(params[:id])
    @dibs = BookMovement.all
  end

  def pay_fine

    @dib = BookMovement.shod(params[:format])
  end

   private

   def issue_params
      params.require(:book_movement).permit(:book_number,:title,:issue_date,:due_date,:student_id,:batch_id,:book_id)
   end
end