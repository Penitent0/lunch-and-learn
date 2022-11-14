class Api::V1::SessionsController < ApplicationController
  before_action :verify_user

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      render json: ErrorSerializer.parse_errors(user.errors), status: 400
    end
  end

  def verify_user
    if !params[:email]
      render json: ErrorSerializer.bad_email
    end
  end
end