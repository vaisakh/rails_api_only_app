class User < ApplicationRecord
  validates_presence_of :user_name, :email_id, :password
  validates :email_id, uniqueness: true
end
