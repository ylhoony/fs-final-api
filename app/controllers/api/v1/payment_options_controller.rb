class Api::V1::PaymentOptionsController < ApplicationController

  def index
    payment_options = PaymentOption.active
    render json: payment_options, status: 200
  end
  
end
