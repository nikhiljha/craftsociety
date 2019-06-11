class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:email, :mcuuid]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:mcuuid])
  end
end
