class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :needs_authentication

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def needs_authentication
    raise 'Not signed in' if current_user.nil?
  end
end
