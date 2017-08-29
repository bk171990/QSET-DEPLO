class FineCollection < ActiveRecord::Base
  belongs_to :student
  belongs_to :book
  belongs_to :fine
end
