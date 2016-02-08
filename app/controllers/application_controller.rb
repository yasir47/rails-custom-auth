class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def signed_in?
    current_user.present?
  end
  helper_method :signed_in?


  private
  def authenticate!
    redirect_to session_new_path and return unless signed_in?
  end

  def check_signed?
    redirect_to root_path if signed_in?
  end

end
