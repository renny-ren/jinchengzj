module Notifications
  class NotificationsController < Notifications::ApplicationController
    def index
      @notifications = notifications.includes(:actor).order("id desc").page(params[:page])
    end

    def clean
    end

    private

    def notifications
      Notification.where(user_id: current_user.id)
    end
  end
end
