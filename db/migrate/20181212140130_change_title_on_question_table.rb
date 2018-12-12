class ChangeTitleOnQuestionTable < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :title, :string, null: false
  end
end
