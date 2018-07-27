class Api::V1::Companies::SuppliersController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      suppliers = @account.suppliers
      if suppliers.present?
        render json: suppliers, status: 200
      else
        render json: { suppliers: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      supplier = @account.suppliers.create(supplier_params)
      if supplier.persisted?
        render json: supplier, status: 201
      else
        render json: supplier.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      supplier = @account.suppliers.find(params[:id])
      if supplier.persisted?
        render json: supplier, status: 201
      else
        render json: supplier.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      supplier = @account.suppliers.find(params[:id])
      if supplier.update(supplier_params)
        render json: supplier, status: 201
      else
        render json: supplier.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def destroy
    
  end

  protected

  def supplier_params
    params.require(:supplier).permit(
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
