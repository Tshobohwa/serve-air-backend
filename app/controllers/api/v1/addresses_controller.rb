class Api::V1::AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update, :destroy]

  # GET api/v1/addresses
  def index
    @addresses = Address.all
    render json: { status: 'success', data: { addresses: @addresses}}
  end

  # GET api/v1/addresses/:id
  def show
    render json: {status: 'success', data: {address: @address} }
  end

  # POST api/v1/addresses
  def create
    @address = Address.new(address_params)
    if @address.save
      render json: { status: 'success', data: { address: @address}}, status: :created
    else
      render json: {status: 'fail', error: @address.errors}, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotUnique
      render json: {status: 'fail', error: {message: "Address #{address_params[:name]} already exists"}}
  end

  # PUT/PATCH api/v1/:id
  def update
    if @address.update(address_params)
      render json: {status: 'success', data: {address: @address}}
    else
      render json: {status: 'fail', errors: @address.errors}, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/:id
  def destroy
    @address.destroy
  end

  private

  def set_address
    @address = Address.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { status:"fail", message: "Address with id #{params[:id]} not found"}, status: :not_found
  end

  def address_params
    params.require(:address).permit(:name)
  end
end
