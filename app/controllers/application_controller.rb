class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  before_filter :authenticate_user!




  #  def current_user
  #    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #  end

end
