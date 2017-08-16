# PrivilegeTag model
class PrivilegeTag < ActiveRecord::Base
  include Activity
  has_many :privileges
  belongs_to :school
  scope :shod, ->(id) { where(id: id).take }
end
