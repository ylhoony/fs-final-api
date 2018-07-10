class Api::V1::CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update]

  def index
    countries = Country.active
    render json: countries, status: 200
  end

  def show
    render json: @country, status: 200
  end

  protected

  def set_country
    @country = Country.find(params[:id])
  end
end
