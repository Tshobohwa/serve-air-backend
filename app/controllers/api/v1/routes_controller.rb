class Api::V1::RoutesController < ApplicationController
  before_action :set_route, only: [:show, :destroy, :update ]
  before_action :verify_address_uniquability, only: [:create]

  # GET api/v1/routes
  def index
    @routes = Route.includes(:origin, :destination)
    render json: { status: 'success', data: { routes: @routes.as_json( include: { origin: { include: :address }, destination: { include: :address } } ) } }
  end

  # GET api/v1/routes/:id
  def show
    render json: {status: 'success', data: { route: @route }}
  end

  # DELETE api/v1/routes/:id
  def destroy
    @route.destroy
  end

  # POST api/v1/
  def create
    puts route_params[:origin_id]
    @route = Route.new(route_params)

    if @route.save
      @new_route = Route.includes(:origin, :destination).where(id: @route[:id])
      render json: { status: 'success', data: { route: @new_route.as_json( include: { origin: { include: :address }, destination: { include: :address } } ) } }, status: :created
    else
      render json: {status: 'fail', error: @route.errors}, status: :unprocessable_entity
    end
   end


  # PUT/PATCH api/v1/:id
  def update
    if @route.update(route_params)
      @new_route = Route.includes(:origin, :destination).find(params[:id])
      render json: { status: 'success', data: { route: @new_route.as_json( include: { origin: { include: :address }, destination: { include: :address } } ) } }
    else
      render json: {status: 'fail', error: @route.errors}, status: :unprocessable_entity
    end
  end

  private

  # Set route from request param :id
  def set_route
    @route = Route.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {status: 'fail', error: { message: "Couldn't find route with id #{params[:id]}"}}, status: :not_found
  end

  # Sanitaze request parameters
  def route_params
    params.require(:route).permit(:origin_id, :destination_id, :pricing)
  end

  # Verify if origin and destination addresses are different
  def verify_address_uniquability
    origin = Origin.find(route_params[:origin_id])
    destination = Destination.find(route_params[:destination_id])

    render json: {status: "fail", error: {message: "Origin address is equal to destination address"}}, status: :unprocessable_entity if origin[:address_id] == destination[:address_id]

    rescue ActiveRecord::RecordNotFound
      render json: {status: "fail", error: {message: "Invalid origin or destination"}}, status: :unprocessable_entity
  end
end
