class Api::V1::DestinationsController < ApplicationController
  before_action :authenticate_user!
  # GET api/v1/destinations
  def index
    @destinations = Destination.includes(:address)

    render json: { status: "success", data: { destinations: @destinations.as_json(include: :address) } }
  end
end
