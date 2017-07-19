class AddReferencesSchoolToQuestionDatabases < ActiveRecord::Migration
  def change
    add_reference :question_databases, :school, index: true, foreign_key: true
  end
end
