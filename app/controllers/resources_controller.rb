class ResourcesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :find_resource, only: [:edit, :update]

  def index
    @resources = Resource.lost.order('updated_at desc')
    filter if params[:res_type].present?
  end

  def create
    create_corresponding_topic
    create_resource
  end

  def new
    @resource = Resource.new
    session[:asset_ids] = []
    render params[:type] == 'lost' ? 'new_lost' : 'new_found'
  end

  def edit
    render params[:type] == 'lost' ? 'edit_lost' : 'edit_found'
  end

  def update
    @resource.update(resource_params)
    @resource.topic.update(title: resource_params[:title])
  end

  def found
    @resources = Resource.found.order('updated_at desc')
    filter if params[:res_type].present?
    render 'index'
  end

  def filter
    @resources = @resources.type_filter(params[:res_type])
  end

  def create_resource
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    @resource.topic_id = @topic.id
    @resource.save
    update_related_assets unless session[:asset_ids].blank?
  end

  def create_corresponding_topic
    @topic = Topic.create(
      user_id: current_user.id,
      title: resource_params[:title],
      node_id: Settings.node_id.lost_and_found,    # 这是“失物招领”的node_id
      body: "body")   # the body is useless for resources
  end

  def update_related_assets
    session[:asset_ids].each do |asset_id|
      @asset = Kindeditor::Asset.find(asset_id)
      @asset.owner_id = @resource.id
      @asset.owner_type = @resource.class.name
      @asset.save
    end
  end


  private 

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:lost_or_found, :res_type, :date, :title, :description)
  end
end