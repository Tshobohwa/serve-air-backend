class Api::V1::RoutesController < ApplicationController
  before_action :set_route, only: [:show, :destroy, :update ]
  # GET api/v1/routes
  def index
    @routes = Route.includes(:origin, :destination)
    render json: {status: 'success', data: { routes: @routes }}
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
      render json: {status: 'success', data: { route: @route}}
    else
      render json: {status: 'fail', error: @route.errors}, status: :unprocessable_entity
    end
    # rescue ActiveRecord::RecordNotUnique
    #   render json: {status: 'fail', error: {message: 'Route already exists'}}, status: :unprocessable_entity
  end


  # PUT/PATCH api/v1/:id
  def update
    if @route.update(route_params)
      render json: {status: 'success', data: { route: @route}}
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

  #Sanitaze request parameters
  def route_params
    params.require(:route).permit(:origin_id, :destination_id, :pricing)
  end
end
