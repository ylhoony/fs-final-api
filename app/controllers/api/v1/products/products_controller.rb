class Api::V1::Products::ProductsController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      products = @account.products
      if products.present?
        render json: products, status: 200
      else
        render json: { products: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      product = @account.products.create(product_params)
      if product.persisted?
        render json: product, status: 201
      else
        render json: product.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      product = @account.products.find(params[:id])
      if product.persisted?
        render json: product, status: 201
      else
        render json: product.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      product = @account.products.find(params[:id])
      if product.update(product_params)
        render json: product, status: 201
      else
        render json: product.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def destroy
    if @account.present?
      product = @account.products.find(params[:id])
      if product.destroy
        render json: product, status: 201
      else
        render json: product.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  protected

  def product_params
    params.require(:product).permit(
      :id, 
      :account_id,
      :product_brand_id,
      :product_category_id,
      :sku,
      :name, 
      :description,
      :base_price,
      :active
    )
  end

end
