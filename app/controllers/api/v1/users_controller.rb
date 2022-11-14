class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.api_key = SecureRandom.hex(15)
      render json: UserSerializer.new(user), status: 201
    else
      render json: ErrorSerializer.parse_errors(user.errors), status: 400
    end
  end

  private

  def user_params 
    params.require(:user).permit(:name, :email)
  end
end