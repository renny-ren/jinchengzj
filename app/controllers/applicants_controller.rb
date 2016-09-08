class ApplicantsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
  		flash[:notice] = "#{@user.login}  注册成功！"
  		redirect_to pages_path	
  	else
  		flash[:notice] = "未填写完整！"
  		render "new"
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:login, :password)
  end
end
