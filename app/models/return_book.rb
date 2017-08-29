class ReturnBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :student
  belongs_to :book_movement
end
