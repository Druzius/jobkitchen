class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def default_url_options
  #   { host: ENV["HOST"] || "localhost:3000" }
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # added admin checkbox on user signup
    devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email_checkbox])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:terms_of_service])
  end
end
