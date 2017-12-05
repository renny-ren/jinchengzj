class Reply < ApplicationRecord
  include SoftDelete

  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy

  after_commit :update_correspondence, :notify_reply, on: :create, unless: -> { system_event? }
  after_destroy :update_after_delete_last_reply

  scope :without_event, -> { where(action: nil) }

  def update_correspondence
    topic.update_last_reply(self)
    user.update_replies_count
  end

  def update_after_delete_last_reply
    topic.update_to_previous_reply(self)
  end

  def notify_reply
    return if self.user == self.topic.user
    Notification.create(
      notify_type: 'reply',
      target: self,
      actor: self.user,
      user: self.topic.user
    )
  end

  def popular?
    'popular' if praises_count >= 5
  end

  def system_event?
    action.present?
  end

  def self.create_event(opts = {})
    opts[:body], opts[:user_id] = "", User.current.id
    return false if opts[:user_id].nil?
    return false if opts[:action].blank?
    self.create!(opts)
  end
end
