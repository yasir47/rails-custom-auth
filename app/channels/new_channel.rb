# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class NewChannel < ApplicationCable::Channel
  def subscribed
     stream_from "new_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Chat.create!(data: data['message'],user_id: data['id'])
    #ActionCable.server.broadcast 'new_channel' , message: data
  end

end
