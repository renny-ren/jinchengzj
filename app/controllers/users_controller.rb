class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    if @user
    else
      render plain: "User not found", status: 404
    end
  end
end
