class MainController < ApplicationController
  before_action :authenticate! , except: :register
  before_action :check_signed? , only: :register
  def index
    @user = current_user
    @chat = Chat.order('created_at').joins(:user)
  end

  def register
    if request.post?
      User.transaction do
          user = User.create!(name: params[:register][:name] )
         puts  params
          if !params[:register][:room_name].nil?
            room = Room.create!(name: params[:register][:room_name])
          else
            room = "public"
          end
          if user.save
            session[:user_id] = user.id
            redirect_to  chat_path(rooms_name: room)
          else
            redirect_to register_path
          end
      end
    end
  end

  def chat_room
    @room = Room.find_by name: params[:rooms_name]
    if @room.present?
    @user = current_user
    @chat = Chat.joins(:room,:user)
                .where("rooms.id = #{@room.id}")
                .order('created_at')

    else @room.nil?
      flash[:alert] = 'The chat room doesnt exist you have to create it'
      redirect_to session_new_path
    end
  end

end
