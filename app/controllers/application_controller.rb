class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user! , except: [:new_invite_user,:invite_user]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :check_user
  layout :set_layout
 
  #Setting different layout for different user
  private
  def set_layout
    if user_signed_in?
      current_user.user? ? "application" : "admin"
    end 
  end

  def check_user
    if current_user.content_admin? or current_user.super_admin?
      redirect_to groups_path
    end
  end

  # configuring registration parameters
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:title,:mobile_number,:active,:registration_code,:status,:memo,:type,:group_id])
  end
end