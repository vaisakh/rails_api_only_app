# frozen_string_literal: true

class V1::AccountsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create]

  def create
    account = Account.create(account_params)
    if account.save
      response = { message: 'Account created successfully' }
      render json: response, status: :created
    else
      render json: account.errors, status: :bad
    end
  end

  private
  def account_params
    params.require(:account).permit(
      :subdomain, :company, owner_attributes: [:user_name, :email_id, :password, :password_digest, :first_name, :last_name])
  end
end
