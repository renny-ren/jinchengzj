class UsersController < ApplicationController
  before_action :set_user

  def show
    render plain: "User not found", status: 404 unless @user
    @topics = @user.topics if @user
  end

  def topics
    @topics = @user.topics
    render template: "/users/show"
  end

  def replies
    @replies = @user.replies
  end

  def followers
    @users = @user.follow_by_users.order("actions.id asc")
  end

  def following
    @users = @user.follow_users.order("actions.id asc")
    render template: "/users/followers"
  end

  def follow
    current_user.follow_user(@user)
  end

  def unfollow
    current_user.unfollow_user(@user)
  end

  def favorites
  end

  def search
  end

  private

  def set_user
    @user = User.find_by_username(params[:username])
  end
end
