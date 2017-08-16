class RepliesController < ApplicationController
  before_action :set_topic

  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.save
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
    @replies = Reply.where(topic_id: @topic.id)
  end

  def reply_params
    params.require(:reply).permit(:body, :topic_id)
  end
end
