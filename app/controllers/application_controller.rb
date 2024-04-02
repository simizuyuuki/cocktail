class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Exception, with: :error_handling
  rescue_from ActionController::RoutingError, with: :render_not_found
  def error_handling
    redirect_to root_path
  end
  def render_not_found
    redirect_to root_path
  end
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end