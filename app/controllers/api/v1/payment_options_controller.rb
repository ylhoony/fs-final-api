class Api::V1::PaymentOptionsController < Api::V1::ApiController

  def index
    payment_options = PaymentOption.active
    render json: payment_options, status: 200
  end

end
