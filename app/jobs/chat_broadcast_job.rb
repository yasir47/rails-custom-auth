class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'new_channel' , message: render_message(message)
  end

  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'chats/chat',locals: {chat: message})
  end

end
