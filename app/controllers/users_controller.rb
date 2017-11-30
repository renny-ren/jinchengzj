class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:follow, :unfollow, :feedback]
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
    current_user.follow_and_notify_user(@user)
  end

  def unfollow
    current_user.unfollow_user(@user)
  end

  def favorites
  end

  def search
  end

  def feedback
  end

  def create_feedback
    if feedback_params[:body].blank?
      redirect_to feedback_path, alert: '请输入反馈内容'
    else
      User.send_feedback_email(feedback_params[:body], feedback_params[:contact_info])
      redirect_to root_path, flash: { success: "如果没有意外，我们已经收到你的反馈。非常感谢！" }
    end
  end

  private

  def set_user
    @user = User.find_by_username(params[:username])
  end

  def feedback_params
    params.require(:feedback).permit(:body, :contact_info)
  end
end
