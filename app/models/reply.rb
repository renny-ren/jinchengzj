class Reply < ApplicationRecord
  include SoftDelete

  belongs_to :topic, counter_cache: true
  belongs_to :user, counter_cache: true

  after_commit :update_corresponding_topic, on: :create
  after_destroy :update_after_delete_reply

  def update_corresponding_topic
    topic.update_last_reply(self)
  end

  def update_after_delete_reply
    topic.update_to_previous_reply(self)
  end

  def popular?
    'popular' if praises_count >= 5
  end
end
