class ChangeColumnsOnAccountTable < ActiveRecord::Migration[5.1]
  def change
    change_column :accounts, :company, :string, null: false
    change_column :accounts, :subdomain, :string, null: false
    change_column :accounts, :owner_id, :integer, null: false
  end
end
