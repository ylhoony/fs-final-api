class Api::V1::WarehousesController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      warehouses = @account.warehouses
      if warehouses.present?
        render json: warehouses, status: 200
      else
        render json: { warehouses: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      warehouse = @account.warehouses.create(warehouse_params)
      if warehouse.persisted?
        render json: warehouse, status: 201
      else
        render json: warehouse.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      warehouse = @account.warehouses.find(params[:id])
      if warehouse.persisted?
        render json: warehouse, status: 201
      else
        render json: warehouse.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      warehouse = @account.warehouses.find(params[:id])
      if warehouse.update(warehouse_params)
        render json: warehouse, status: 201
      else
        render json: warehouse.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end

  end

  def destroy
    
  end

  protected

  def set_warehosue
    
  end

  def warehouse_params
    params.require(:warehouse).permit(
      :account_id,
      :name,
      :contact,
      :street1,
      :street2,
      :city,
      :state,
      :country_id,
      :postal_code,
      :email,
      :phone,
      :fax,
      :active
    )
  end

end


