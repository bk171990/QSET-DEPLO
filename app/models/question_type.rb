# QuestionType model
class QuestionType < ActiveRecord::Base
  include Activity
  has_many :weightages
  belongs_to :school
  validates :que_type, presence: true, length: \
  { minimum: 1, maximum: 50 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
end
