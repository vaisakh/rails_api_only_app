class ChangeTypeOnQuestionTable < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :type, :string, null: false
  end
end
