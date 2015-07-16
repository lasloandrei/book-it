class CustomController < ApplicationController
  def index
    render json: Reservation.all
    @reservation = Reservation.all
  end

  def show
  end

  def new
    @custom = Contact.new
    #@contact.reservation.build
  end

  def create
    @contact = Contact.new(custom_params)

    if @contact.save
    	render json: @contact
    else
    	render json: @contact.errors
    end
  end

  def edit
  end

  def custom_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :email,
    	reservations_attributes: [:dining_table_id, :date, :observation])
  end
  
  def reservation_params

  end

  def update
  end
  
  def destroy
  end
end
