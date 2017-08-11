class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @nodes = Node.all
    @topics = Topic.all
    @last_reply = Reply.where(topic_id: 1)
  end

  def new
    @topic = Topic.create
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :node_id)
  end
end
