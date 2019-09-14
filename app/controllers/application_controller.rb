class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_zuser, :logged_in?

  def current_zuser
    @current_zuser ||= Zuser.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_zuser
  end

  def require_zuser
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
