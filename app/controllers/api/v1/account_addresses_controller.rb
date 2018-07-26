class Api::V1::AccountAddressesController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      addresses = @account.addresses
      if addresses.present?
        render json: addresses, status: 200
      else
        render json: { addresses: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      address = @account.addresses.create(address_params)
      if address.persisted?
        render json: address, status: 201
      else
        render json: address.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      address = @account.addresses.find(params[:id])
      if address.persisted?
        render json: address, status: 201
      else
        render json: address.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      address = @account.addresses.find(params[:id])
      if address.update(address_params)
        render json: address, status: 201
      else
        render json: address.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def destroy
    
  end

  protected

  def address_params
    params.require(:address).permit(
      :account_id,
      :company_name,
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
