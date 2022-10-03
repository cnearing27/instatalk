class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
    current_user.update(online: true)
    ActionCable.server.broadcast 'online_channel', user: current_user
  end

  def unsubscribed
    current_user.update(online: false)
    ActionCable.server.broadcast 'online_channel', user: current_user
  end
end
