class Api::V1::Admin::CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :update]

  def index
    currencies = Currency.all
    render json: currencies, status: 200
  end

  def create
    currency = Currency.new(currency_params)
    if currency.save
      render json: currency, status: 200
    else
      render json: currency.errors, status: 403
    end
  end

  def show
    render json: @currency, status: 200
  end

  def update
    if @currency.update(currency_params)
      render json: @currency, status: 200
    else
      render json: @currency.errors, status: 403
    end
  end

  protected

  def set_currency
    @currency = Currency.find(params[:id])
  end

  def currency_params
    params.require(:currency).permit(:name, :alpha, :numeric, :active)
  end
end
