class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :check_logged_in

  def current_user
  	return nil if session[:token].nil?
  	@current_user ||= User.includes(:cart).find_by(session_token: session[:token])
  end

  def log_in(user)
  	session[:token] = user.reset_session_token
  end

  def log_out
  	current_user.reset_session_token!
  	session[:token] = nil
  end

  def check_logged_in
    unless current_user
      redirect_to root_url
    end
  end
end
