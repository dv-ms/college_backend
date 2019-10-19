# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include Accessible
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if self.resource != nil
      Sidekiq::Client.enqueue(EmailWorker, 2, resource.email, "User Login alert email", "Login detected for your account. If it wasnt you, then click the link below. \n\n http://localhost:3000/login/abuse")
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
