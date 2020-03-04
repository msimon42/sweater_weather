class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: {'api_key' => user.api_key}, status: 201
    else
      render json: 'Invalid email or password', status: 400
    end
  end
end
