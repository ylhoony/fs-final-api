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
    
  end

  def show
    
  end

  def update
    
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


