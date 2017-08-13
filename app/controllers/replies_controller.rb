class RepliesController < ApplicationController
  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.save 
    redirect_to topics_path
  end

  private

  def reply_params
    params.require(:reply).permit(:body, :topic_id)
  end
end
