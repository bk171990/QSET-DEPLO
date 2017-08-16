# FinanceFine model
class FinanceFine < ActiveRecord::Base
  include Activity
  belongs_to :finance_fee_collection
  belongs_to :school
  scope :shod, ->(id) { where(id: id).take }
end
