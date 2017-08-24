class PraisesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_target

  def index
    @users = @target.praise_by_users
    render :index, layout: false
  end

  def create
    current_user.praise(@target)
  end

  def destroy
    current_user.cancel_praise(@target)
  end

  private

  def set_target
    @target = params[:table].constantize.find(params[:id])
  end
end