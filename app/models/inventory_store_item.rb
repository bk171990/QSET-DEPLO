class InventoryStoreItem < ActiveRecord::Base
  belongs_to :batch
  belongs_to :supplier
  has_many :invoice_items
  has_many :claims
  has_many :archived_items
  scope :listitem, -> { all + ArchivedItem.all }
  scope :shod, ->(id) { where(id: id).take }
  scope :list, ->(s, e) \
  { where(date: s..e) }
  validates :batch_id, presence: true
  validates :supplier_id, presence: true
  validates :item_name, presence: true
  validates :quantity, presence: true
  validates :category, length: { in: 1..160 } 

  def self.search_item(search)
    InventoryStore.where('name LIKE ?', "%#{search}%")
  end

  def archived_item
    inventory_store_item_attributes = attributes
    inventory_store_item_attributes['inventory_store_item_id'] = id
    ArchivedItem.create(inventory_store_item_attributes)
  end
end