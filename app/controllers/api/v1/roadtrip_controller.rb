class Api::V1::RoadtripController < ApplicationController
  def show
    if User.valid_api_key?(params[:api_key])
      render json: RoadTripSerializer.new(RoadTrip.new(params[:origin], params[:destination]))
    else
      render json: 'Invalid api key', status: 401
    end     
  end
end
