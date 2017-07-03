class Claim < ActiveRecord::Base
  belongs_to :batch
  belongs_to :supplier
  belongs_to :inventory_store_item
  has_many :storeitems, dependent: :destroy
  scope :shod, ->(id) { where(id: id).take }
  scope :result_published, -> { where(result_published: true) }
  validates :comment, length: { in: 1..160 }

  def publish_claim(ex)
    flag = true
    if ex.purchase_date >= Date.today
  end

  def supplier_name
    [first_name, last_name].join(' ')
  end
  
  def self.advance_search(search, batch)
    Claim.where['claim_item ?',"%#{search}%"]
  end

  def self.search_claim(search)
    return if search.empty?
      where "claim_item like ?", "#{search}%"
    end
  end
end