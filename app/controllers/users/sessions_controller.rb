class Users::SessionsController < Devise::SessionsController
  include MixPanel
# before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  def new
    mix_panel_sign_in("","Sign In Page")
    super
  end

  # POST /resource/sign_in
  # def create
  #   mix_panel_sign_in(current_user,"Sign In Page")
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
