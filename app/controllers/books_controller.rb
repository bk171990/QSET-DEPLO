class BooksController < ApplicationController

    def main_page
    end

  def index
   @books = Book.all
    if params[:search]
      @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end

	def new
   @book = Book.new
   @bookcats = BookCategory.all
	end

	def edit
    @book = Book.find(params[:id])
  end

  def select_subject
    @batch = Batch.shod(params[:batch][:id])
    @subjects ||= @batch.subjects
  end

  def select
    @subject = Subject.shod(params[:subject][:id])
  end

	def create
   @book = Book.new(book_params) 
   redirect_to books_path
   
   @count = params[:tag][:count].to_i
    unless params[:tag][:count] == ""
      saved = 0
      temp_book_number = params[:book][:book_number]
      
      @count.times do |c|
        book_number = temp_book_number
        if @book = Book.create(:title=> params[:book][:title], :author=> params[:book][:author], :book_number =>book_number,:book_category_id =>params[:book][:book_category_id],:publication_id =>params[:book][:publication_id],:status=>'Available')
          unless @book.id.nil?
            saved += 1
            temp_book_number = temp_book_number.next
        end
       end
      end
    end
  end

   def update
     @book = Book.find(params[:id])
   if @book.update(book_params)
     redirect_to books_path
    else 
      render 'edit'
   end
  end

    def destroy
     @book = Book.find(params[:id])
     @book.delete
     redirect_to books_path
    end

    def advance_search
     @books ||= Book.all
    end

  def advance_book_search
    params[:advance_search]
    @books = Book.advance_search(params[:advance_search])
  end


  def new_category
   @bookcat = BookCategory.new
   @bookcats = BookCategory.all
  end


   def add_category
    @bookcat = BookCategory.new(category_params)
    if @bookcat.save
    redirect_to new_category_books_path
  else
    render 'new_category'
  end
end
 

 def edit_category
  @bookcat = BookCategory.find(params[:id])
 end

 def update_category
     @bookcat = BookCategory.find(params[:id])
   if @bookcat.update(category_params)
     redirect_to new_category_books_path
    else 

      render 'edit_category'
   end
 end

  def destroy_category
     @bookcat = BookCategory.find(params[:id])
     @bookcat.delete
     redirect_to new_category_books_path
  end

  def search_book
    @book = Book.new
  end

  def issue_book
    @issuebook = IssueBook.new
  end

  def create_issue
     @issuebook = IssueBook.new(issue_params) 
  if @issuebook.save
    redirect_to issue_index_book_books_path
   else
    render 'issue_book'
  end
  end

  def issue_index_book
  @books = Book.all
  @students = Student.all
  @issuebooks = IssueBook.all
  end
	
	def show
	  @book = Book.find(params[:id])
	end

  def show_book_details
    @book = Book.find(params[:id])
  end

  def search
    @books ||= Book.search_book(params[:search])
  end

 private

  def book_params
    params.require(:book).permit(:title,:author,:book_number,:status,:book_category_id,:book_price, :publication_id)
  end

  def category_params
    params.require(:book_category).permit(:barcode,:book_type)
  end

  def issue_params
    params.require(:issue_book).permit(:Issue_date,:Due_date,:book_taken)
  end

  def student_params
    params.require(:student).permit!
  end

  def category
    @book_category = BookCategory.shod(params[:id])
  end
end