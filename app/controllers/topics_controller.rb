class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @nodes = Node.all
    @topics = Topic.all
  end

  def new
    @topic = Topic.new(user_id: current_user.id)
    @nodes = Node.all
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
    @replies = Reply.unscoped.where(topic_id: @topic.id).order(:id).all
    @reply = Reply.first
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :node_id)
  end
end
