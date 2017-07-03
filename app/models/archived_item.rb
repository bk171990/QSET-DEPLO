class ArchivedItem < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :batch
  scope :shod, ->(id) { where(id: id).take }
  belongs_to :inventory_store_item
  validates :option, presence:true
  validates :return_qty, presence:true
end
