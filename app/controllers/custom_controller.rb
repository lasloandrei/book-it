class CustomController < ApplicationController
  def index
    render json: Reservation.all
    @reservation = Reservation.all
  end

  def show
  end

  def new
    @contact = Contact.new
    
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
    	render json: @contact
    else
    	render json: @contact.errors
    end
  end

  def edit
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email,
    	reservations_attributes: [:contact_id, :dining_table_id, :date, :observation])
  end
  
  def reservation_params

  end

  def update
  end
  
  def destroy
  end
end
