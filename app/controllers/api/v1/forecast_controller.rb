class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(ForecastGenerator.new(params[:location]))
  end
end
