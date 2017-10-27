class User
  module Followable
    extend ActiveSupport::Concern

    included do
      action_store :follow, :user, counter_cache: 'followers_count', user_counter_cache: 'following_count'
    end

    def follow_and_notify_user(user)
      return unless user
      self.create_action(:follow, target: user)
      Notification.notify_follow(self.id, user.id)
    end
  end
end
