# UserPrivilege model
class UserPrivilege < ActiveRecord::Base
  belongs_to :user
  belongs_to :privilege
  belongs_to :school
end
