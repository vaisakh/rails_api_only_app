class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email_id, :password

  #this is where parameters are taken when the command is called
  def initialize(email_id, password)
    @email_id = email_id
    @password = password
  end

  # mandatory: define a #call method. its return value will be available through #result
  # this is where the result gets returned #SimpleCommand -> ServiceObjects
  def call
    Utils::TokenManager.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by_email_id(email_id)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end
