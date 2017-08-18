class UsersController < ApplicationController
  before_action :set_user

  def show
    render plain: "User not found", status: 404 unless @user
    @topics = @user.topics
  end

  def topics
    @topics = @user.topics
  end

  def replies
    @replies = @user.replies
  end

  private

  def set_user
    @user = User.find_by_username(params[:username])
  end
end
