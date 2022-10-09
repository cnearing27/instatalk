class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
    current_user.update(online: true)
    ActionCable.server.broadcast 'online_channel', user: current_user
  end

  def unsubscribed
    current_user.update(online: false) if connections == 0
    ActionCable.server.broadcast 'online_channel', user: current_user
  end

  private

  def connections
    ActionCable.server.connections.count { |connection| connection.current_user == current_user }
  end
end
