class Api::V1::Products::ProductCategoriesController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      product_categories = @account.product_categories.order(name: :asc)
      if product_categories.present?
        render json: product_categories, status: 200
      else
        render json: { product_categories: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      product_category = @account.product_categories.create(product_category_params)
      if product_category.persisted?
        render json: product_category, status: 201
      else
        render json: product_category.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      product_category = @account.product_categories.find(params[:id])
      if product_category.persisted?
        render json: product_category, status: 201
      else
        render json: product_category.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      product_category = @account.product_categories.find(params[:id])
      if product_category.update(product_category_params)
        render json: product_category, status: 201
      else
        render json: product_category.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def destroy
    if @account.present?
      product_category = @account.product_categories.find(params[:id])
      if product_category.destroy
        render json: product_category, status: 201
      else
        render json: product_category.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  protected

  def product_category_params
    params.require(:product_category).permit(
      :account_id,
      :name, 
      :active,
      :likecount
    )
  end

end
