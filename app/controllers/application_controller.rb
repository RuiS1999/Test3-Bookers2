class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # flash[:notice] = "Signed in successfully."
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    # flash[:notice] = "Signed out successfully."
    root_path
  end

  protected
  # protectedとprivateの違い
  # protected = クラス内だけでなく、継承先のクラスでも使える
  # private = クラス内でのみアクセス可能。継承先では使用できない。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end



end