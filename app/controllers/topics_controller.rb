class TopicsController < ApplicationController
  load_and_authorize_resource only: [:edit, :create, :update, :destroy,
                                     :favorite, :unfavorite, :follow, :unfollow]

  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_topic, only: [:update, :show, :edit]
  before_action :set_nodes, only: [:new, :edit]

  def index
    @topics = Topic.topped.order('updated_at desc')
  end

  def new
    @topic = Topic.new(user_id: current_user.id)
    session[:asset_ids] = []
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    update_related_assets unless session[:asset_ids].blank?
  end

  def update
    @topic.update(topic_params)
  end

  def show
    @replies = Reply.where(topic_id: @topic.id)
    render_404 if @topic.deleted?
    @topic.view_times.incr(1)
  end

  def edit
  end

  def destroy
    if params[:type] == 'res'
      @topic.destroy
      redirect_to resources_path, flash: { success: '删除成功' }
    else
      @topic.destroy_by(current_user)
      redirect_to topics_path, flash: { success: '删除成功' }
    end
  end

  def node
    @node = Node.find(params[:id])
    @topics = @node.topics.order('updated_at desc')
    render 'index'
  end

  def action
    case params[:type]
    when 'excellent'
      @topic.excellent
      redirect_to @topic, notice: '加精成功'
    when 'cancel_excellent'
      @topic.cancel_excellent
      redirect_to @topic, notice: '取消精华成功'
    when 'top'
      @topic.top
      redirect_to @topic, notice: '置顶成功'
    when 'untop'
      @topic.untop
      redirect_to @topic, notice: '取消置顶成功'
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_nodes
    @nodes = Node.where.not(id: Settings.node_id.lost_and_found)
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :node_id)
  end
end
