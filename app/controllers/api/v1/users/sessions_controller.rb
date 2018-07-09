# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: sign_in_params[:email])
    if user && user.valid_password?(sign_in_params[:password])
      sign_in(:user, user) # Update sign in record with Devise method.
      # Create token with JWT - 'lib/jwt_auth
      user = { id: user.id, email: user.email }
      token = JwtAuth.encode_token({ user: user })
      render json: { token: token, user: user }, status: 200
    else
      render json: { errors: "Email or Password does not match." }, status: 500
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    # Use Custom Parameter Sanitizer set up in 'app/lib/devise/user' for resource correction.
    Devise::UserParameterSanitizer.new(User, :user, params)
  end
end
