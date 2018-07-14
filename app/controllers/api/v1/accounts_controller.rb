class Api::V1::AccountsController < Api::V1::ApiController
  before_action :set_account, only: [:show, :update, :destory]

  def index
    accounts = current_user.accounts.all
    render json: accounts, status: 200
  end

  def create
    account = current_user.accounts.create(account_params)
    if account.persisted?
      current_user.employees.find(account[:id]).update(subscriber: true)
      render json: account, status: 200
    else
      render json: account.errors
    end
  end

  def show
    render json: @account, status: 200
  end

  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors
    end
  end

  def destroy
    
  end

  protected

  def set_account
    @account = current_user.accounts.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :dba, :street1, :street2, :city, :state, :country_id, :postal_code, :currency_id)
  end
end
