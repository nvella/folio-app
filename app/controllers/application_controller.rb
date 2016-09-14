class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :needs_authentication, :current_user_owns_folio?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user_owns_folio?
    current_user == @folio.user
  end

  def needs_own_folio
    raise 'You do not own this folio' if !current_user_owns_folio?
  end

  def needs_authentication
    raise 'Not signed in' if current_user.nil?
  end
end
