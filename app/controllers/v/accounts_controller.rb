# frozen_string_literal: true

class V::AccountsController < ApplicationController
  skip_before_action :load_schema, only: %i[create]
  skip_before_action :authenticate_request, only: %i[create]

  def create
    account = Account.new(account_params)
    if account.valid?
      Apartment::Tenant.create(account.subdomain)
      Apartment::Tenant.switch!(account.subdomain)
      account.save
      #return subdomain?
      render json: true, status: :created
    else
      render json: false, status: :bad
    end
  end

  private
  def account_params
    params.require(:account).permit(
      :subdomain, :company, owner_attributes: [:user_name, :email_id, :password, :password_digest, :first_name, :last_name])
  end
end
