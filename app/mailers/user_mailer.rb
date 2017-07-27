class UserMailer < ApplicationMailer
  def welcome(user_id)
    @user = User.find_by_id(user_id)
    return false if @user.blank?
    mail(from: "锦城之家 <admin@jinchengzj.com>", to: @user.email, subject: "欢迎加入锦城之家！")
  end
end
