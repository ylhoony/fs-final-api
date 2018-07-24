class Api::V1::Companies::CustomersController < Api::V1::ApiController

  def index
    binding.pry
    

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

  def set_customer
    
  end

  def customer_params
    params.require(:customer).permit(
      :account_id,
      :name,
      :tax_id,
      :comment,
      :warehouse_id,
      :payment_term_id,
      :currency_id,
      :active
    )
  end

end
