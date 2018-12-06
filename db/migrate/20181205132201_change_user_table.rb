class ChangeUserTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:users, :active, :boolean, limit: 1)
  end
end
