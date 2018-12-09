# frozen_string_literal: true

class V::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]

  def register
    user = User.create(user_params)
    if user.save
      response = { message: 'User created successfully' }
      render json: response, status: :created
    else
      render json: user.errors, status: :bad
    end
  end

  def login
    authenticate params[:email_id], params[:password]
  end

  def test
    render json: {
      message: 'You have passed authentication and authorization test'
    }
  end

  def list
    users = User.all
    render json: users, status: :ok
  end

  def info
  end

  def update
    #decode password
  end

  def delete
  end

  private
  def authenticate(email_id, password)
    command = AuthenticateUser.call(email_id, password)
    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors  }, status: :unauthorized
    end
  end

  def user_params
    params.permit(
      :user_name,
      :email_id,
      :password,
      :first_name,
      :last_name,
      :active
    )
  end
end
