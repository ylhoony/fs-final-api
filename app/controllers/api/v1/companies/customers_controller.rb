class Api::V1::Companies::CustomersController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      customers = @account.customers
      if customers.present?
        render json: customers, status: 200
      else
        render json: { customers: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      customer = @account.customers.create(customer_params)
      if customer.persisted?
        render json: customer, status: 201
      else
        render json: customer.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      customer = @account.customers.find(params[:id])
      if customer.persisted?
        render json: customer, status: 201
      else
        render json: customer.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      customer = @account.customers.find(params[:id])
      if customer.update(customer_params)
        render json: customer, status: 201
      else
        render json: customer.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def destroy
    
  end

  protected

  def customer_params
    params.require(:customer).permit(
      :account_id,
      :type,
      :name,
      :tax_id,
      :comment,
      :warehouse_id,
      :payment_term_id,
      :currency_id
    )
  end

end
