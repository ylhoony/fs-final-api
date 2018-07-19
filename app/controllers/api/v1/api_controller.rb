class Api::V1::ApiController < ApplicationController
  before_action :require_sign_in, except: [:auth_current_user]

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
      render json: decoded[0]["user"], status: 200
    else
      render_unauthorized("Access Denied")
    end
  end

  def current_account
    render json: current_user.current_account, status: 200
  end

  def update_current_account
    current_user.current_account = Account.find(params[:account_id])
    return current_account
  end

  protected

  def render_unauthorized(message)
    return render json: { errors: [ message: message ] }, status: :unauthorized
  end
  
end