class CommentsController < ApplicationController
  before_action :set_topic, :set_reply

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :reply_id)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
    @replies = Reply.where(topic_id: @topic.id)
  end

  def set_reply
    @reply = Reply.find(params[:reply_id])
  end
end
