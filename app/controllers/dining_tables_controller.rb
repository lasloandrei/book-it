class DiningTablesController < ApplicationController
  api :GET, '/dining_tables'
  def index
  	dining_tables = DiningTable.order(:id)
  	dining_tables = dining_tables.where(zone_id: params[:zone_id]) if params[:zone_id].present?
    render json: dining_tables
  end

  def show
    render json: DiningTable.find(params[:id])
  end

  def new
  end
end
