class Api::V1::PaymentTermsController < Api::V1::ApiController

  def index
    account = current_user.accounts.find_by(id: params[:current_account_id])
    if account.present?
      payment_terms = account.payment_terms
      if payment_terms.present?
        render json: payment_terms, status: 200
      else
        render json: { payment_terms: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end

  end

  def create
    
  end

  def update
    
  end

  protected

  def payment_term_params

  end

  def set_payment_term
    
  end

end
