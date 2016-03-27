class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters  
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
