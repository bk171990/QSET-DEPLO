class Fine < ActiveRecord::Base
  belongs_to :book_movement
  belongs_to :student
  belongs_to :book
end
