class CustomController < ApplicationController
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
  end

  def create
    @contact = Contact.new(contact_params)
    @reservation = Reservation.new(reservation_params)
    if @contact.save && @reservation.save
      redirect_to custom_path
    else
          render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end

  def custom_params
    params.require(:custom).permit(:first_name, :last_name, :phone_number, :email, :contact_id, :dining_table_id, :date, :observation)
  end

  def update
    @custom = Custom.find(params[:id])
      if @custom.update_attributes(custom_params)
        redirect_to custom_path, notice: 'Your Custom Reservation was updated !'
      else
        render 'edit'
      end
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: 'Your Contact was deleted !'
end
