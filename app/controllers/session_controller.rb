class SessionController < ApplicationController
  before_action :check_signed? , except: :destroy
  def new
    @user = User.new
  end

  def create
     user = User.find_by(name: params[:name])
     if user.present?
       session[:user_id] = user.id
       redirect_to root_path
     else
       redirect_to session_new_path
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session_new_path
  end

end
