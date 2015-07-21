class ContactsController < ApplicationController
  api :GET, '/contacts'
  api :POST, '/contacts/new'
  api :PATCH, '/contact/:id/edit'
  api :DELETE, '/contacts/:id/destroy'
  def index
    render json: Contact.all
    @contacts = Contact.all
  end

  def show
    #render json: Contact.find(params[:id])
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    # @contacts = Contact.find(params[:id])
    @reservations = @contact.reservations.build
  end

  def create
    @contact = Contact.new(custom_params)
    if @contact.save
      redirect_to contacts_path, notice: 'Your Contact was created !'
      # flash[:notice] = "Contact successfully created."

    else
      render json: @contact.errors
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def custom_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email,
    reservations_attributes: [:dining_table_id, :date, :observation])
  end

  def update
    @contact = Contact.find(params[:id])
      if @contact.update_attributes(contact_params)
        redirect_to contacts_path, notice: 'Your Contact was updated !'
      else
        render 'edit'
      end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: 'Your Contact was deleted !'
  end
end
