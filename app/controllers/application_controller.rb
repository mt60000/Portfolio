class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    flash[:alert] = "ようこそmoodsへ！"
    root_path
  end

  def after_sign_in_path_for(resource)
    flash[:alert] = "おかえりなさい#{current_user.name}さん！"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:alert] = "ログアウトしました！"
    top_path
  end



  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
