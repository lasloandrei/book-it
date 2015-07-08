class ContactsController < ApplicationController
  api :GET, '/contacts'
  def index
    render json: Contact.all
    @contacts = Contact.all
  end

  def show
    render json: Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    # @contacts = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_url
      # flash[:notice] = "Contact successfully created."
    else
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email)
  end
end
