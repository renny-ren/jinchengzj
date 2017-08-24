class Reply < ApplicationRecord
  belongs_to :topic, counter_cache: true
  belongs_to :user, counter_cache: true

  after_commit :update_corresding_topic, on: :create

  def update_corresding_topic
    topic.update_last_reply(self)
  end

  def popular?
    'popular' if praises_count >= 5
  end
end
