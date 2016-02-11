# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class NewChannel < ApplicationCable::Channel
  def subscribed
    stream_from room_chat
    if !@room.nil?
      @room.count +=1
      @room.save
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stream_from room_chat
    if !@room.nil?
      @room.count -= 1
      if @room.count < 1
        @room.destroy
      else
        @room.save
      end
    end
  end

  def speak(data)
    Chat.create!(data: data['message'],user_id: data['id'],room_id: data['room_id'])
    #ActionCable.server.broadcast 'new_channel' , message: data
  end

  private

  def room_chat
    @room = Room.find_by(name: params[:chat])
    if !@room.nil?
      "new_#{@room.name}"
    else
      'new_test'
    end
  end

end
