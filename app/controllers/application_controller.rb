class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    lists_path
  end
  
  def after_sign_in_path_for(resource)
    about_path
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  
def resource
   :customer
end

def resource
   @resource ||= User.new
end

def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
end


end