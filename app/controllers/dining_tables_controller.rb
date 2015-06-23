class DiningTablesController < ApplicationController

  def index
	render json: DiningTable.all
  end

  def show
  	render json: DiningTable.find(1)
  end

end
