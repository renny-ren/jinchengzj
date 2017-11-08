class ResourcesController < ApplicationController
  before_action :find_resource, only: [:show, :edit]

  def index
    @resources = Resource.order('created_at desc')
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    @resource.save
    redirect_to resources_path
  end

  def show
    @replies = Reply.where(resource_id: @resource.id)
  end

  def new
    render params[:type] == 'lost' ? 'new_lost' : 'new_found'
  end

  def edit
  end

  def update
  end

  def destroy
    @resource.destroy
  end

  private 

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:lost_or_found, :res_type, :date, :description)
  end
end