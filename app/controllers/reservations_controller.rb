class ReservationsController < ApplicationController

  api :GET, '/reservations'
  def index
	render json: Reservation.all
  end

  def show
    render json: Reservation.find(params[:id])
  end

end
