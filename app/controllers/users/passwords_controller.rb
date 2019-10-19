# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  include Accessible
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    
  end

  # PUT /resource/password
  def update
    super
      if resource.errors.empty?
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        if flash_message == :updated
          Sidekiq::Client.enqueue(EmailWorker, 6, resource.email, "Update password successful", "User password update successful.")
        end
      else
      end
    else
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
