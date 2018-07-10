class Api::V1::CompaniesController < Api::V1::ApiController
  before_action :set_company, only: [:show, :update, :destory]

  def index
    companies = current_user.companies.all
    render json: companies, status: 200
  end

  def create
    company = current_user.companies.create(company_params)
    if company.persisted?
      current_user.employees.find(company[:id]).update(subscriber: true)
      render json: company, status: 200
    else
      render json: company.errors
    end
  end

  def show
    render json: @company, status: 200
  end

  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors
    end
  end

  def destroy
    
  end

  protected

  def set_company
    @company = current_user.companies.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :dba, :street1, :street2, :city, :state, :country_id, :postal_code, :currency_id)
  end
end
