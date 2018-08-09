class Api::V1::CurrenciesController < Api::V1::ApiController
  before_action :set_currency, only: [:show, :update]

  def index
    currencies = Currency.active
    render json: currencies, status: 200
  end

  def show
    render json: @currency, status: 200
  end

  protected

  def set_currency
    @currency = Currency.find(params[:id])
  end
  
end
