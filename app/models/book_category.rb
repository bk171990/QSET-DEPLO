class BookCategory < ActiveRecord::Base
	belongs_to :book
	scope :shod, ->(id) { where(id: id).take }
end
