module NotificationExtends
  extend ActiveSupport::Concern

  included do
    belongs_to :actor, class_name: Notifications.config.user_class
    belongs_to :user, class_name: Notifications.config.user_class

    belongs_to :target, polymorphic: true
    belongs_to :second_target, polymorphic: true
    belongs_to :third_target, polymorphic: true

    scope :unread, -> { where(read_at: nil) }
  end

  def read?
    self.read_at.present?
  end

  def actor_name
    return '' if self.actor.blank?
    self.actor.send(Notifications.config.user_name_method)
  end

  module ClassMethods
    def read!(ids = [])
      return if ids.blank?
      Notification.where(id: ids).update_all(read_at: Time.now)
    end

    def unread_count(user)
      Notification.where(user: user).unread.count
    end
  end
end
