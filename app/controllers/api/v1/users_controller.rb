class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  #GET api/v1/users
  def index
    @users = User.all
    render json: { status: 'success', data: { users: @users }}
  end

  # GET api/v1/users/:id
  def show
    render json: {status: 'success', data: { user: @user}}
  end

  # POST api/v1/users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: 'success', data: {user: @user}}
    else
      render json: {status: 'fail', errors: @user.errors}, status: :unprocessable_entity
    end
  end

  # PUT/PATCH api/v1/users/:id
  def update
    if @user.update(user_params)
      render json: { status: 'success', data: {user: @user}}
    else
      render json: {status: 'fail', errors: @user.errors}, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/users/:id
  def destroy
    @user.destroy
  end

  private

  # Set user with id from request params
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
      render json: {status: 'fail', message: "Couldn't find user with id #{params[:id]}" }, status: :not_found
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address_id)
  end
end
