class ApplicationController < ActionController::Base
  attr_reader :current_user

  protected

  def authenticate_request!
    unless valid_token_format?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find auth_token[:user_id]
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

  def http_token
    @http_token ||= if (token = request.headers['Authorization']).present?
      token.split(' ').last
    end
  end

  def auth_token
    @auth_tokenm ||= JSONWebToken.decode http_token
  end

  def valid_token_format?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
