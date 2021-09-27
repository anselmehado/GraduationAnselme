class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  #before_action :login_required

  private

  def login_required
    redirect_to new_session_path unless current_user
  end


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_role])
    #corine ajout modification
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #corine ajout modification
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
