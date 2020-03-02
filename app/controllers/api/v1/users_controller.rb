class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: {'api_key' => user.api_key}
    else
      render json: {'errors' => user.errors.full_messages.to_sentence}, status: 400
    end     
  end

  private
    def user_params
      params.permit(:email, :password)
    end
end
