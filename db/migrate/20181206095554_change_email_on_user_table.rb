class ChangeEmailOnUserTable < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :email_id, :string, null: false
  end
end
