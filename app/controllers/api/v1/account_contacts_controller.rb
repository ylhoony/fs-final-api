class Api::V1::AccountContactsController < Api::V1::ApiController
  before_action :set_account

  def index
    if @account.present?
      contacts = @account.contacts
      if contacts.present?
        render json: contacts, status: 200
      else
        render json: { contacts: [] }, status: 200
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def create
    if @account.present?
      contact = @account.contacts.create(contact_params)
      if contact.persisted?
        render json: contact, status: 201
      else
        render json: contact.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def show
    if @account.present?
      contact = @account.contacts.find(params[:id])
      if contact.persisted?
        render json: contact, status: 201
      else
        render json: contact.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def update
    if @account.present?
      contact = @account.contacts.find(params[:id])
      if contact.update(contact_params)
        render json: contact, status: 201
      else
        render json: contact.errors, status: 400
      end
    else
      render render json: { errors: [ message: "Access Denied" ] }, status: :unauthorized
    end
  end

  def destroy
    
  end

  protected

  def contact_params
    params.require(:contact).permit(
      :account_id,
      :first_name,
      :last_name,
      :job_title,
      :email,
      :phone,
      :mobile,
      :fax,
      :comment,
      :active
    )
  end

end


