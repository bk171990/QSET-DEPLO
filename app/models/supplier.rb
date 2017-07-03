class Supplier < ActiveRecord::Base
  belongs_to :supplier_type
  has_many :suppliers
  has_many :claims
  validates :organization_name, presence:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :address_street1, presence:true

  def supplier_name
    [first_name, last_name].join(' ')
  end
end
