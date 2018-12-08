class User < ApplicationRecord
  #Validations
  validates_presence_of :user_name, :email_id, :password_digest
  validates :email_id, uniqueness: true

  #encrypt password
  has_secure_password
end
