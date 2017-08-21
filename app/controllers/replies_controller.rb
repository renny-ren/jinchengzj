class RepliesController < ApplicationController
  load_and_authorize_resource :reply

  before_action :set_topic
  before_action :set_reply, only: [:edit, :update]

  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.save
  end

  def edit
  end

  def update
    @reply.update(reply_params)
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
    @replies = Reply.where(topic_id: @topic.id)
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:body, :topic_id)
  end
end
