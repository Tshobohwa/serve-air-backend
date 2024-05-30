class Api::V1::OriginsController < ApplicationController
  # GET api/v1/destinations
  def index
    @origins = Origin.includes(:address)

    render json: { status: "success", data: { origins: @origins.as_json(include: :address) } }
  end
end
