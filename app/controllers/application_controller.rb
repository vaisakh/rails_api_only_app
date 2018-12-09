class ApplicationController < ActionController::API
  before_action :load_schema
  before_action :authenticate_request
  attr_reader :current_user

  include ExceptionHandler

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized'  }, status: 401 unless @current_user
  end

  def load_schema
    Apartment::Tenant.switch!('public')
    return unless request.subdomain.present?

    account = Account.find_by(subdomain: request.subdomain)
    if account
      Apartment::Tenant.switch!(request.subdomain)
    else
      #invalid subdomain
      render json: {error: 'Invalid subdomain'}
    end
  end
end
