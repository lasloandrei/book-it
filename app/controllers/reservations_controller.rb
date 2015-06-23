class ReservationsController < ApplicationController

  def index
	render json: Reservation.all
  end

  def show
    render json: Reservation.find(1)
  end

end
