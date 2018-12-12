class ChangeSurveyIdOnQuestionTable < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :survey_id, :integer, null: false
  end
end
