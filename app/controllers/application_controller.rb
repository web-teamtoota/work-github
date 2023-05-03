class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    customer_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
    #root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end





#def resource
#   :customer
# end

# def resource
#   @resource ||= User.new
# end

# def devise_mapping
#   @devise_mapping ||= Devise.mappings[:user]
# end


end
# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

# protected
#   def after_sign_in_path_for(resource)
#     if customer_signed_in?
#         root_path #login後遷移path要変更確認用なので
#     else
#       admin_items_top_path #login後遷移path確認用なので要変更
#     end
#   end

#   def after_sign_out_path_for(resource)
#     if resource == :admin
#     else root_path
#     end
#   end
#     if admin_signed_in?
#         root_path #login後遷移path要変更確認用なので
#     else
#             new_admin_session_path
#     end
  


#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up,
#                                         keys: [:last_name, :first_name, :last_name_kana, :email,
#                                                 :first_name_kana, :postcode, :city, :phone_number ])
#   end
  
# end