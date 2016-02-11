class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    room_name =  Room.find_by(id: message.room_id)
    ActionCable.server.broadcast "new_#{room_name.name}" , message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'chats/chat',locals: {chat: message})
  end

end
