class TopicsController < ApplicationController
  load_and_authorize_resource :topic

  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_topic, only: [:update, :show, :edit]
  before_action :set_nodes, only: [:new, :edit]

  def index
    @topics = Topic.without_resources
  end

  def new
    @topic = Topic.new(user_id: current_user.id)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_path
  end

  def update
    @topic.update(topic_params)
  end

  def show
    @replies = Reply.where(topic_id: @topic.id)
    @topic.view_times.incr(1)
  end

  def edit
  end

  def destroy
    @topic.destroy_by(current_user)
    redirect_to params[:type] == 'res' ? resources_path : topics_path, notice: '删除成功'
  end

  def action
    case params[:type]
    when "excellent"
      @topic.excellent(current_user)
      redirect_to @topic, notice: "加精成功"
    when "cancel_excellent"
      @topic.cancel_excellent(current_user)
      redirect_to @topic, notice: "取消精华成功"
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_nodes
    @nodes = Node.where.not(name: '失物招领')
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :node_id)
  end
end
