# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      encoded_token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user),
        token: encoded_token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      encoded_token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user),
                     token: encoded_token }
    else
      render json: { error: 'Wrong credentials' }
    end
  end

  private

  def user_params
    params.permit(:name, :username, :password, :email, :location, :interests)
  end
end
