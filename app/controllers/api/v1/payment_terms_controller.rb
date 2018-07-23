class Api::V1::PaymentTermsController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      payment_terms = @account.payment_terms
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
    if @account.present?
      payment_term = @account.payment_terms.create(payment_term_params)
      if payment_term.persisted?
        render json: payment_term, status: 201
      else
        render json: payment_term.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      payment_term = @account.payment_terms.find(params[:id])
      if payment_term.persisted?
        render json: payment_term, status: 201
      else
        render json: payment_term.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    
  end

  protected

  def set_payment_term
    
  end

  def payment_term_params
    params.require(:payment_term).permit(
      :account_id,
      :payment_option_id,
      :name,
      :days,
      :trade_credit_rate,
      :trade_credit_days,
      :active
    )
  end

  def set_account
    @account = current_user.accounts.find_by(id: params[:current_account_id])
  end

end
