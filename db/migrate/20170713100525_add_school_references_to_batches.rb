class AddSchoolReferencesToBatches < ActiveRecord::Migration
  def change
    add_reference :batches, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
