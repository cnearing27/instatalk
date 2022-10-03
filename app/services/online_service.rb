class OnlineService
  def initialize(users)
    @users = users
  end

  def perform
    broadcast_online
  end

  private

  def broadcast_online
    ActionCable.server.broadcast "online_channel",
      users: @users
  end

  def render_online
    ApplicationController.renderer.render(partial: 'users/online', locals: {
      online_users: @users_online
    })
  end
end
