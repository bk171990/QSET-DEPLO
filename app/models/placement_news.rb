# PlacementNews model
class PlacementNews < ActiveRecord::Base
  include Activity
  belongs_to :school
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  # validates :content, presence: true, length: { minimum: 1, maximum: 9000 }
end
