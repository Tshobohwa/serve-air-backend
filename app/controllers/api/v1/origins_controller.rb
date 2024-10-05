class Api::V1::OriginsController < ApplicationController
  before_action :authenticate_user!
  # GET api/v1/destinations
  def index
    @origins = Origin.includes(:address)

    render json: { status: "success", data: { origins: @origins.as_json(include: :address) } }
  end
end
