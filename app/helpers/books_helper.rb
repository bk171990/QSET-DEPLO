module BooksHelper

 def book_category_collect
   @bookcats.collect { |c| [c.book_type, c.id] }
 end
end
