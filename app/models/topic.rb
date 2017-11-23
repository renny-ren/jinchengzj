class Topic < ApplicationRecord
  include Redis::Objects
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include TailorAdmin::TopicAdmin
  include SoftDelete

  belongs_to :user, counter_cache: true
  belongs_to :node, counter_cache: true
  has_many :replies, dependent: :destroy
  has_one :resource, dependent: :destroy
  has_many_kindeditor_assets :attachments, dependent: :destroy

  validates :title, :body, :node_id, presence: true

  counter :view_times, default: 0

  scope :without_resources, -> { where("deleted_at is null && node_id != 7") }

  def update_last_reply(reply)
    return false if reply.blank?

    self.last_reply_at = reply.created_at
    self.last_reply_user_id = reply.user.id
    self.last_reply_user_nickname = reply.user.nickname
    self.last_reply_user_username = reply.user.username
    self.replies_count = replies.without_event.count
    save!
  end

  def update_to_previous_reply(deleted_reply)
    return false if deleted_reply.blank?
    return false if deleted_reply.user_id != last_reply_user_id

    last_reply = replies.where.not(id: deleted_reply.id).order(id: :desc).first
    update_last_reply(last_reply) 
  end

  def destroy_by(user)
    update_columns(deleted_by: user.username)
    destroy
  end

  def popular?
    "popular-topic" if praises_count > 4
  end

  def excellent(operator)
    update!(is_excellent: true)
    Reply.create_event(action: 'excellent', topic_id: self.id, user_id: operator.id)
  end

  def cancel_excellent(operator)
    update!(is_excellent: false)
    Reply.create_event(action: 'cancel_excellent', topic_id: self.id, user_id: operator.id)
  end
end

# Topic.import