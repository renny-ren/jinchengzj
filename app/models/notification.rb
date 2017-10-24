# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model

  # Write your custom methods...
  def self.notify_follow(user)
    Notification.create notify_type: 'follow',
    actor: current_user, user: user
  end
end
