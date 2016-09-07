class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authentication(params[:login], params[:password])
  	if @user
  		flash[:notice] = "Welcome #{@user.login}"
  		redirect_to pages_path
  	else
  		flash[:notice] = "账号或密码不正确。"
  	  redirect_to pages_path
  	end
  end
end
