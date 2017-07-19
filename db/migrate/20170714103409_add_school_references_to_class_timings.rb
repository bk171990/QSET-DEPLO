class AddSchoolReferencesToClassTimings < ActiveRecord::Migration
  def change
    add_reference :class_timings, :school, index: true, foreign_key: true
  end
end
