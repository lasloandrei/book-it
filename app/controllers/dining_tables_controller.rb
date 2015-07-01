class DiningTablesController < ApplicationController

  api :GET, '/dining_tables'
  def index
	render json: DiningTable.all
  end

  def show
  	render json: DiningTable.find(params[:id])
  end

end
