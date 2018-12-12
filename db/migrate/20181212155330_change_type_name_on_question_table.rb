class ChangeTypeNameOnQuestionTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :type, :q_type
  end
end
