class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name email password password_confirmation posts_counter])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password])
  end
end
