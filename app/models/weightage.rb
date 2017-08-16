# Weightage model
class Weightage < ActiveRecord::Base
  include Activity
  belongs_to :placement_exam
  belongs_to :question_type
  belongs_to :school
end
