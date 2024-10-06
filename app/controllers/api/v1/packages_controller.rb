class Api::V1::PackagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_package, only: [:show, :update, :destroy]

  # GET api/v1/packages
  def index
    address_id = params[:address_id]


    @warehouse = Package.where(current_address_id: address_id).order(created_at: :desc)

    @outgoing_packages = Package.where(origin_id: address_id).order(created_at: :desc)

    @incoming_packages = Package.where(destination_id: address_id).order(created_at: :desc)

    render json: {
      status: 'success',
      data: {
        incoming_packages: @incoming_packages.as_json(include: [:origin, :destination, :current_address, :creator, :status]),
        outgoing_packages: @outgoing_packages.as_json(include: [:origin, :destination, :current_address, :creator, :status]),
        warehouse: @warehouse.as_json(include: [:origin, :destination, :current_address, :creator, :status])
      }
    }
  end

  # GET api/v1/packages/:id
  def show
    render json: {
      status: 'success',
      data: {
        package: @package.as_json(include: [:origin, :destination, :current_address, :creator, :status])
      }
    }
  end

  # POST api/v1/packages
  def create
    @package = Package.new(package_params)
    if @package.save
      render json: {
        status: 'success',
        data: {
          package: @package.as_json(include: [:origin, :destination, :current_address, :creator, :status])
        }
      }, status: :created
    else
      logger.debug @package.errors.full_messages
      render json: {
        status: 'fail',
        error: {
          message: "Couldn't create package",
          errors: @package.errors.full_messages
        }
      }, status: :bad_request
    end
  end

  # PUT/PATCH api/v1/packages/:id
  def update
    if @package.update(package_params)
      render json: {
        status: 'success',
        data: {
          package: @package.as_json(include: [:origin, :destination, :current_address, :creator, :status])
        }
      }
    else
      render json: {
        status: 'fail',
        error: {
          message: "Couldn't update package",
          errors: @package.errors.full_messages
        }
      }
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
    params.require(:shippment).permit(:weight, :description, :status_id, :route_id, :current_address_id, :creator_id, :sender_name, :sender_phone_number, :receiver_name, :receiver_phone_number, :price, :origin_id, :destination_id)
  end
end
