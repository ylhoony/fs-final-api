class Api::V1::Companies::CustomersController < Api::V1::ApiController
  before_action :set_account

  def index
    # binding.pry    
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

  def supplier_params
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
