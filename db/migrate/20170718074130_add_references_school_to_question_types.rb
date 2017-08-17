class AddReferencesSchoolToQuestionTypes < ActiveRecord::Migration
  def change
    add_reference :question_types, :school, index: true, foreign_key: true, foreign_key: {on_delete: :cascade}
  end
end
