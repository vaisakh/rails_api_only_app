class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, primary_key: 'user_id' do |t|
      t.string :user_name, limit: 200, null: false
      t.string :password
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.string :email_id, limit: 100

      t.timestamps
    end
  end
end
