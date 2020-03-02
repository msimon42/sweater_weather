class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: UnsplashService.new.image_by_location(params[:location])
  end
end
