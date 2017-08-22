class Configurable < ActiveRecord::Base
	  validates :name_tag, uniqueness: true
end
