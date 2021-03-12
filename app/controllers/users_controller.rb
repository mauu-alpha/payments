class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)

    if @user.valid?
      render json: {user: @user, token: encode_token({user_id: @user.id})}, status: :created
    else
      render json: {error: "Invalid username or password"}, status: :unprocessable_entity
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      render json: {user: @user, token: encode_token({user_id: @user.id})}
    else
      render json: {error: "Invalid username or password"}, status: :unauthorized
    end
  end


  def auto_login
    render json: current_user
  end

  private

  def user_params
    params.permit(:username, :password, :birthdate)
  end
end
