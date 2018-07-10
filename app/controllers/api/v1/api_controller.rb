class Api::V1::ApiController < ApplicationController
  before_action :require_sign_in, except: [:current_user]

  def require_sign_in
    authenticate_token || render_unauthorized("Access Denied")
  end

  def authenticate_token
    bearer_token = request.env["HTTP_AUTHORIZATION"]
    auth_token = request.env["HTTP_AUTHORIZATION"].split(" ")[1]
    return nil if bearer_token.nil? || auth_token.nil?
    JwtAuth.decode_token(auth_token)
  end

  def current_user
    User.find(authenticate_token[0]["user"]["id"])
  end

  def auth_current_user
    decoded = authenticate_token
    if decoded.present?
      render json: decoded[0], status: 200
    else
      render_unauthorized("Access Denied")
    end
  end

  protected

  def render_unauthorized(message)
    return render json: { errors: [ message: message ] }, status: :unauthorized
  end
  
end