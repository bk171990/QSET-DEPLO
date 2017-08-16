# StudentExam model
class StudentExam < ActiveRecord::Base
  include Activity
  belongs_to :placement_exam
  belongs_to :student
  belongs_to :school
end
