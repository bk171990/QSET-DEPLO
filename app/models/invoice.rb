class Invoice < ActiveRecord::Base
  belongs_to :inventory_store
  belongs_to :student
  belongs_to :guardian
  belongs_to :employee
  belongs_to :inventory_store_item
  has_many :invoice_items
  belongs_to :batch
  has_many :invoice_items
  has_many :archived_items
  scope :shod, ->(id) { where(id: id).take }

  def self.set_invoice_no
    date = Date.today.strftime('%d')
    if Invoice.first.nil?
      'IN' + date.to_s + '1'
    else
      last_id = Invoice.last.id.next
      'IN' + date.to_s + last_id.to_s
    end
  end

end
 