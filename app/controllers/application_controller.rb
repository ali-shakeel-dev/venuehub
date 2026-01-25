class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :configure_permitted_parameters, if: :devise_controller?

  allow_browser versions: :modern

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def not_found
    render template: 'errors/404', status: :not_found
  end
end
