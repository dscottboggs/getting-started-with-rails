class AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_for_database_authentication email: params[:email]
    if user.valid_password? params[:password]
      render json: payload user
    else
      render json: errors: ['Not Authenticated'] }, status: :unauthorized
    end
  end

  private

  def payload(user)
    return unless user and user.id
    {
      auth_token: JSONWebToken.encode({user_id: user.id}),
      user: { id: user.id, email: user.email }
    }
  end
end
