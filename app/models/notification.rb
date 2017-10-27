# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model

  # Write your custom methods...
  def self.notify_follow(follower_id, user_id)
    Notification.create(
      notify_type: 'follow', actor_id: follower_id, user_id: user_id
    )
  end
end
