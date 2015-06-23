class ZonesController < ApplicationController

  def index
	render json: Zone.all
  end

  def show
  	render json: Zone.find(1)
  end

end
