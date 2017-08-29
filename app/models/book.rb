class Book < ActiveRecord::Base
belongs_to :batch
has_many :book_movements
belongs_to :course
has_many :fines
has_many :book_categories
scope :shod, ->(id) { where(id: id).take }
scope :status, -> { where(status: 'Available') }

  def self.search(search)
    where("book_number LIKE ? OR author LIKE ? OR status LIKE ? OR title LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%") 
  end

def self.search_book(search)
  where("book_number LIKE ? OR author LIKE ? OR status LIKE ? OR title LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%") 
end


    def self.search_script(search,book)
      script = ''
      if search[:book_number].present?
      book = Book.find(search[:book_number])
      script += ' Book: ' + book.book_number + ', ' unless book.nil?
    end
    if search[:author].present?
      script += ' Author: ' + Book.find(search[:author])
    end
   end
end

