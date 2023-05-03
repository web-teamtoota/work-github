# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_invalid_customer, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
   #def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

def reject_invalid_customer
   customer = Customer.find_by(email: params[:customer][:email])
   return unless customer

   return if customer.valid_password?(params[:customer][:password]) && customer.active_for_authentication?
  reset_session
end


#???↓
#   protected
# # 退会しているかを判断するメソッド
# def customer_state
#   ## 【処理内容1】 入力されたemailからアカウントを1件取得
#   @customer = Customer.find_by(email: params[:customer][:email])
#   ## アカウントを取得できなかった場合、このメソッドを終了する
#   return if !@customer
#   ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
#   if @customer.valid_password?(params[:customer][:password])
#     ## 【処理内容3】
#   end
# end



  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        # flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to destroy_customer_session_path
      # else
      #   flash[:notice] = "項目を入力してください"
      end
    end
  end

end