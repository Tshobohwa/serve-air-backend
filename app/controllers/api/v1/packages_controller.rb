class Api::V1::PackagesController < ApplicationController
  before_action :set_package, only: [:show, :update, :destroy]

  # GET api/v1/packages
  def index
    address_id = params[:address_id]
    origin_id = params[:origin_id]
    destination_id = params[:destination_id]

    if origin_id
      origin_route = Route.find_by(origin_id: origin_id)
      @outgoing_packages = origin_route ? Package.where(route_id: origin_route.id) : []
    else
      @outgoing_packages = []
    end

    if destination_id
      destination_route = Route.find_by(destination_id: destination_id)
      @incoming_packages = destination_route ? Package.where(route_id: destination_route.id) : []
    else
      @incoming_packages = []
    end

    if address_id
      @warehouse = Package.where(current_address_id: address_id)
    else
      @warehouse = []
    end

    @packages = Package.all
    render json: {
      status: 'success',
      data: {
        packages: @packages,
        incoming_packages: @incoming_packages,
        outgoing_packages: @outgoing_packages,
        warehouse: @warehouse
      }
    }
  end

  # GET api/v1/packages/:id
  def show
    render json: { status: 'success', data: { package: @package } }
  end

  # POST api/v1/packages
  def create
    @package = Package.new(package_params)
    if @package.save
      render json: { status: 'success', data: { package: @package } }
    else
      logger.debug @package.errors.full_messages
      render json: { status: 'fail', error: { message: "Couldn't create package", errors: @package.errors.full_messages } }
    end
  end

  # PUT/PATCH api/v1/packages/:id
  def update
    if @package.update(package_params)
      render json: { status: 'success', data: { package: @package } }
    else
      render json: { status: 'fail', error: { message: "Couldn't update package", errors: @package.errors.full_messages } }
    end
  end

  # DELETE api/v1/packages/:id
  def destroy
    @package.destroy
    render json: { status: 'success', message: 'Package deleted successfully' }
  end

  private

  def set_package
    @package = Package.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { status: 'fail', message: "Package with id #{params[:id]} not found" }, status: :not_found
  end

  def package_params
    params.require(:package).permit(:weight, :description, :status_id, :route_id, :current_address_id, :creator_id, :sender_name, :sender_phone_number, :receiver_name, :receiver_phone_number, :price)
  end
end
