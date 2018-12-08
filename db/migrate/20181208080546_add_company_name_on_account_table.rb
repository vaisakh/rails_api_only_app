class AddCompanyNameOnAccountTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:accounts, :company, :string)
  end
end
