class Report < ActiveRecord::Base
  belongs_to :student
  belongs_to :guardian
  belongs_to :user
  belongs_to :employee
  belongs_to :school
end
