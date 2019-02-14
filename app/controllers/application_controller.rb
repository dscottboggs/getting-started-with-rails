class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user, :auth_present?

  def render_error(message, status, formatting=:markdown)
    @error_message = message if message
    @error_status = status
    @formatting = formatting
    if status
      render 'error', status: status
    else
      render 'error'
    end
  end

  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= if auth_present?
                        if token &&
                           (user = User.find_by name: token["user"]) &&
                           (token["expiry"].to_time > Time.now)
                          user
                        else
                          puts "didn't find user with token #{token}"
                        end
                      end
  end

  def authenticate!
    render status: 401 unless logged_in?
  end

  private

  def token
    @token ||= Auth.decode session['token']
  rescue JWT::VerificationError
    session['token'] = nil
  end

  def auth_present?
    !!session['token']
  end
  
end
