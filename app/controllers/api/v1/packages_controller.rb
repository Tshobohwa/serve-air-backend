class Api::V1::PackagesController < ApplicationController
  before_action :set_package, only: [:show, :update, :destroy]

  # GET api/v1/packages
  def index
    @packages = Package.all
    render json: { status: 'success', data: { packages: @packages } }
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
