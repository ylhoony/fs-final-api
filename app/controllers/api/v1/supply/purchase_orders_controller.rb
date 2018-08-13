class Api::V1::Supply::PurchaseOrdersController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      purchase_orders = @account.purchase_orders
      if purchase_orders.present?
        render json: purchase_orders, status: 200
      else
        render json: { purchase_orders: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      purchase_order = @account.purchase_orders.create(purchase_order_params)
      if purchase_order.persisted?
        render json: purchase_order, status: 201
      else
        render json: purchase_order.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      purchase_order = @account.purchase_orders.find(params[:id])
      if purchase_order.persisted?
        render json: purchase_order, status: 201
      else
        render json: purchase_order.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      purchase_order = @account.purchase_orders.find(params[:id])
      if purchase_order.update(purchase_order_params)
        render json: purchase_order, status: 201
      else
        render json: purchase_order.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  protected

  def purchase_order_params
    params.require(:purchase_order).permit(
      :type,
      :account_id,
      :account_address_id,
      :account_contact_id,
      :supplier_id,
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
