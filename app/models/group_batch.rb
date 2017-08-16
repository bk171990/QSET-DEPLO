# GroupBatch model
class GroupBatch < ActiveRecord::Base
  include Activity
  belongs_to :batch_group
  belongs_to :school
  scope :shod, ->(id) { where(id: id).take }
end
