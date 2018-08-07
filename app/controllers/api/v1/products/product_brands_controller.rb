class Api::V1::Products::ProductBrandsController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      product_brands = @account.product_brands
      if product_brands.present?
        render json: product_brands, status: 200
      else
        render json: { product_brands: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      product_brand = @account.product_brands.create(product_brand_params)
      if product_brand.persisted?
        render json: product_brand, status: 201
      else
        render json: product_brand.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      product_brand = @account.product_brands.find(params[:id])
      if product_brand.persisted?
        render json: product_brand, status: 201
      else
        render json: product_brand.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      product_brand = @account.product_brands.find(params[:id])
      if product_brand.update(product_brand_params)
        render json: product_brand, status: 201
      else
        render json: product_brand.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def destroy
    if @account.present?
      product_brand = @account.product_brands.find(params[:id])
      if product_brand.destroy
        render json: product_brand, status: 201
      else
        render json: product_brand.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  protected

  def product_brand_params
    params.require(:product_brand).permit(:account_id, :name, :active)
  end



end
