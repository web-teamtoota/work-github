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

  def reject_invalid_customer
    customer = Customer.find_by(email: params[:customer][:email])
    return unless customer

    return if customer.valid_password?(params[:customer][:password]) && customer.active_for_authentication?
    reset_session
  end

  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        redirect_to destroy_customer_session_path
      end
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end