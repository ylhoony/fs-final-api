class Api::V1::Demand::SalesOrdersController < Api::V1::ApiController
  before_action :set_account

  def index

  end

  def create
    
  end

  def show
    
  end

  def update
    
  end

  protected

  def sales_order_params
    params.require(:sales_order).permit(
      :type,
      :account_id,
      :account_address_id,
      :account_contact_id,
      :customer_id,
      :billing_address_id,
      :shipping_address_id,
      :warehouse_id,
      :currency_id,
      :payment_term_id,
      :order_reference,
      :comment,
      :order_date
    )
  end

end
