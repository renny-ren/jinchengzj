class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.username = params[resource_name][:username]
    if verify_rucaptcha?(resource) && resource.save      
      set_flash_message! :notice, :signed_up   # 显示注册成功信息
      sign_in(resource_name, resource)   # 若注册成功自动登录
      respond_with resource, location: after_sign_up_path_for(resource)   # 若注册成功进行跳转
    else
      respond_with resource
    end
  end
end