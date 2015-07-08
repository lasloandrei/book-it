class ZonesController < ApplicationController
  api :GET, '/zones'
  def index
    render json: Zone.all
  end

  def show
    render json: Zone.find(params[:id])
  end
end
