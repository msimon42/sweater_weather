class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      user.generate_api_key
      render json: {'api_key' => user.api_key}, status: 201
    else
      render json: {'errors' => user.errors.full_messages.to_sentence}, status: 400
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
