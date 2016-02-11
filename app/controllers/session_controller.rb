class SessionController < ApplicationController
  before_action :check_signed? , except: :destroy
  def new
    @user = User.new
    @room = Room.all
  end

  def create
     user = User.find_by(name: params[:name])
     if user.present?
       session[:user_id] = user.id
       room = params[:rooms_name].nil? ? 'public' : params[:rooms_name]
       @room_id = Room.find_by(name: room)
       redirect_to chat_path(rooms_name: room,room_id: @room_id.id)
     else
       redirect_to session_new_path
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to session_new_path
  end

end
