# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

#   def after_sign_in_path_for(resource)
#     customer_path
#   end

#   def after_sign_out_path_for(resource)
#     # new_admin_session_path
#     root_path
#   end

#   protected
#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
#   end





#def resource
#   :customer
# end

# def resource
#   @resource ||= User.new
# end

# def devise_mapping
#   @devise_mapping ||= Devise.mappings[:user]
# end


# end


# end





# class ApplicationController < ActionController::Base
#   before_action :configure_permitted_parameters, if: :devise_controller?

# protected
#   def after_sign_in_path_for(resource)
#     if customer_signed_in?
#         customer_path
#     else
#       admin_root_path
#     end
#   end

#   def after_sign_out_path_for(resource)
#       # new_customer_session_path
#     # new_user_session_path
#     if resource == :admin
#       new_admin_session_path
#     else
#       root_path
#     end
#   end


#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up,
#                                         keys: [:last_name, :first_name, :last_name_kana, :email,
#                                                 :first_name_kana, :postcode, :city, :phone_number ])
#   end
# end


# class ApplicationController < ActionController::Base

#     # ログイン後のリダイレクト先
#     def after_sign_in_path_for(resource_or_scope)
#       if resource.is_a?(Admin)
#         admin_root_path
#       else
#         customer_path
#       end
#     end

#     # ログアウト後のリダイレクト先
#     def after_sign_out_path_for(resource_or_scope)
#       if resource_or_scope == :admin
#         new_admin_session_path
#       else
#         root_path
#       end
#     end
# end





# class ApplicationController < ActionController::Base

# def after_sign_up_path_for(resource)
#   case resource
#   when Admin
#     admin_root _path
#   when Public
#     customer_path
#   end
# end

# def after_sign_out_path_for(resource)
#     case resource
#     when :admin   # ログアウト時はシンボルが返ってくる
#     new_admin_session_path
#     when :public  # ログアウト時はシンボルが返ってくる
#       root_path
#     end
# end

# end




  # before_action :configure_permitted_parameters, if: :devise_controller?

# protected
#   def after_sign_in_path_for(resource)
#     if customer_signed_in?
#         customer_path
#     else
#       admin_root_path
#     end
#   end

#   def after_sign_out_path_for(resource)
#     if resource_params == :admin
#     # if resource == :admin
#     #if customer_signed_in?
#       root_path
#     else new_admin_session_path
#     end
#   end


#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up,
#                                         keys: [:last_name, :first_name, :last_name_kana, :email,
#                                                 :first_name_kana, :postal_code, :address, :telephone_number ])
#   end
# end

class ApplicationController < ActionController::Base


private
def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_root_path
    else
        customer_path
    end
end



def
  after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :public
        root_path
    elsif resource_or_scope == :admin
        #root_path
        new_admin_session_path
     else
      root_path
      new_admin_session_path
     end
  end

def after_sign_out_path_for(resource_or_scope)
    root_path
    new_admin_session_path
end
  
end