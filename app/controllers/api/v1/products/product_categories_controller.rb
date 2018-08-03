class Api::V1::Products::ProductCategoriesController < Api::V1::ApiController

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

  def product_category_params
    params.require(:product_cateogry).permit(:account_id, :name, :active)
  end

end
