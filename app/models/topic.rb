class Topic < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :node, counter_cache: true
  has_many :replies, dependent: :destroy

  # counter :view_times, default: 0

  def update_last_reply(reply)
    self.last_reply_at = reply.created_at
    self.last_reply_user_id = reply.user.id
    self.last_reply_user_nickname = reply.user.nickname
    self.last_reply_user_username = reply.user.username
    save
  end

  def update_to_previous_reply(deleted_reply)
    previous_reply = replies.where.not(id: deleted_reply.id).order(id: :desc).first
    update_last_reply(previous_reply)
  end

  def popular?
    "popular-topic" if praises_count > 4
  end
end
