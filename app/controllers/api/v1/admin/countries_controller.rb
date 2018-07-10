class Api::V1::Admin::CountriesController < API::V1::ApiController
  before_action :set_country, only: [:show, :update]

  def index
    countries = Country.all
    render json: countries, status: 200
  end

  def create
    country = Country.new(country_params)
    if country.save
      render json: country, status: 200
    else
      render json: country.errors, status: 403
    end
  end

  def show
    render json: @country, status: 200
  end

  def update
    if @country.update(country_params)
      render json: @country, status: 200
    else
      render json: @country.errors, status: 403
    end
  end

  protected

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :alpha2, :alpha3, :numeric, :active)
  end

end
