class ListeningController < WebsocketRails::BaseController
  def message_send
    receive_message = message()
    broadcast_message(:message, receive_message)
	end
end
