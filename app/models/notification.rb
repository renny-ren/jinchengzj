# Auto generate with notifications gem.
class Notification < ApplicationRecord
  include NotificationExtends

  def self.notify_follow(follower_id, user_id)
    Notification.create(
      notify_type: "follow",
      actor_id: follower_id,
      user_id: user_id
    )
  end
end
