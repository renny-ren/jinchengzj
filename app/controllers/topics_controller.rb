class TopicsController < ApplicationController
  load_and_authorize_resource :topic

  before_action :authenticate_user!, only: [:new, :create, :update]

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

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
  end

  def show
    @topic = Topic.find(params[:id])
    @replies = Reply.where(topic_id: @topic.id)
  end

  def edit
    @topic = Topic.find(params[:id])
    @nodes = Node.all
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :node_id)
  end
end
