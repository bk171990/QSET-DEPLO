class LibraryController < ApplicationController
	
	def lib_index
    end

	def add_book
     @lib = Book.new(library_params)
	 @lib.save
        redirect_to @add_book_library_index 
	end

	def show
	 @lib = Book.find(params[:id])
	end

private
  def library_params
    params.require(:library).permit!
  end


end
