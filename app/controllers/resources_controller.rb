class ResourcesController < ApplicationController
  def index
    @resources = Resource.order('created_at desc')
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    @resource.save
    redirect_to resources_path
  end

  def new
    render params[:type] == 'lost' ? 'new_lost' : 'new_found'
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
  end

  def destroy
    @resource.destroy
  end

  private 

  def resource_params
    params.require(:resource).permit(:lost_or_found, :res_type, :date, :description)
  end
end