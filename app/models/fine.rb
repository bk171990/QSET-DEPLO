class Fine < ActiveRecord::Base
  belongs_to :book_movement
  belongs_to :student
  belongs_to :book
  scope :list, ->(s, e) \
  { where(date: s..e) }
end
