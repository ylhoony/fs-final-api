# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # binding.pry
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource) # Update User sign_up records
        # Add line for JWT Token Authorization
        user = { id: resource.id, email: resource.email }
        token = JwtAuth.encode_token({ user: user })
        render json: { token: token, user: user }, status: 201
      else
        expire_data_after_sign_in! # Not sure what this does yet.
        # => Add line for Authorization
        render json: resource, status: 201
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render json: resource.errors.full_message, status: 500  # Return validation error messages
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # def devise_parameter_sanitizer
    # Use Custom Parameter Sanitizer set up in 'app/lib/devise/user' for resource correction.
    # Devise::UserParameterSanitizer.new(User, :user, params)
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # Use Custom Parameter Sanitizer set up in 'app/lib/devise/user' for resource correction.
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    Devise::UserParameterSanitizer.new(User, :user, params)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
