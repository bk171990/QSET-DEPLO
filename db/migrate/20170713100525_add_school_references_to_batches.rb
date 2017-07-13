class AddSchoolReferencesToBatches < ActiveRecord::Migration
  def change
    add_reference :batches, :school, index: true, foreign_key: true
  end
end
