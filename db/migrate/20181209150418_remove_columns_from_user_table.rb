class RemoveColumnsFromUserTable < ActiveRecord::Migration[5.1]
  def change
    remove_columns(:users, :first_name, :last_name)
  end
end
