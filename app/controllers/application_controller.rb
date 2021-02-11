class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger


  protected
  def after_sign_in_path_for(resource)
    edit_user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end
  
  def autheniticate_user
    unless current_user == nil
      flash[:notice]="ログインが必要です"
      redirect_to new_user_session_path
    end
  end


end
