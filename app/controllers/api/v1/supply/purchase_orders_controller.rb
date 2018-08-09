class Api::V1::Supply::PurchaseOrdersController < Api::V1::ApiController


  def index
    
  end

  def create
    
  end

  def show
    
  end

  def update
    
  end

  def destroy
    
  end

  protected

  def purchase_order_params
    params.require(:puchase_order).permit(
      :type,
      :account_id,
      :account_address_id,
      :account_contact_id,
      :customer_id,
      :supplier_id,
      :billing_address_id,
      :shipping_address_id,
      :warehouse_id,
      :currency_id,
      :order_reference,
      :comment,
      :order_date
    )
  end

end
