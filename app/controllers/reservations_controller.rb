class ReservationsController < ApplicationController

  api :GET, '/reservations'
  def index
	render json: Reservation.all
  end

  def show
    render json: Reservation.find(params[:id])
  end

  def new
  
    @reservation = Reservation.new
    #@contacts = Contact.find(params[:id])
  end

  def create
  
    @reservation = Reservation.new(contact_params)
    if @reservation.save
    	redirect_to reservations_url
    	#flash[:notice] = "Contact successfully created."
    
    else
    	render 'new'
    end


  end

  private

  def contact_params
  	params.require(:reservation).permit(:contact_id, :dining_table_id, :date, :observation)
  end

end
