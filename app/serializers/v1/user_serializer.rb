class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :password, :first_name, :last_name, :email_id, :active

  def id
    Utils::EncryptManager.encrypt object.id
  end
end
