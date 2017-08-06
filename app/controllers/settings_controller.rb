class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show; end

  def password; end

  def update
    case params[:by]
    when 'password'
      update_password
    else
      update_basic
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(KEYS_ARRAY)
  end

  def update_basic
    if @user.update(user_params)
      redirect_to setting_path, notice: '更新成功'
    else
      render 'show'
    end
  end

  def update_password
    if @user.update_with_password(user_params)
      redirect_to new_user_session_path, notice: '修改密码成功，请使用新密码重新登陆。'
    else
      render 'password'
    end
  end
end
