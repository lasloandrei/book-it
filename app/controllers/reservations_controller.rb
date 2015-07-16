class ReservationsController < ApplicationController
  api :GET, '/reservations'
  api :POST, '/reservations/new'
  api :PATCH, '/reservations/:id/edit'
  api :DELETE, '/reservations/:id/destroy'
  def index
    render json: Reservation.all
  end

  def show
    # render json: Reservation.find(params[:id])
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def reservation_params
    params.require(:reservation).permit(:contact_id, :dining_table_id, :date, :observation)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_url
    else
      render 'new'
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
      if @reservation.update_attributes(reservation_params)
        redirect_to reservation_path, notice: 'Your Reservation was updated !'
      else
        render 'edit'
      end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_path, notice: 'Your Reservation was deleted !'
  end
end
