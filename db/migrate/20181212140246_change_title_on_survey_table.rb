class ChangeTitleOnSurveyTable < ActiveRecord::Migration[5.1]
  def change
    change_column :surveys, :title, :string, null: false
  end
end
