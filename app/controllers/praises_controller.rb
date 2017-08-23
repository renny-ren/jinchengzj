class PraisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_target

  def create
    current_user.praise(@target)
  end

  def destroy
    current_user.cancel_praise(@target)
  end

  private

  def set_target
    @target = Topic.find(params[:id])
  end
end