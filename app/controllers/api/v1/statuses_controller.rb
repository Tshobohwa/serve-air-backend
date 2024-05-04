class Api::V1::StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :destroy]

  # GET /status
  def index
    @statuses = Status.all
    render json: { status: "success", data:  { statuses: @statuses}}
  end

  # GET /status/1
  def show
    render json: { status: 'success', data: { status: @status}}
  end

  # POST /status
  def create
    @status = Status.new(resource_params)
    if @status.save
      render json: { status: 'success', data: { status: @status}}, status: :created
    else
      render json: {status: 'fail', error: @status.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /status/1
  def update
    if @status.update(resource_params)
      render json: {status: 'success', data: { status: @status}}
    else
      render json: {status: 'fail', error: @status.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /status/1
  def destroy
    @status.destroy
  end

  private
    # Find status by id
    def set_status
      @status = Status.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Status with id #{params[:id]} not found" }, status: :not_found
    end

    # Sanitize status request params
    def resource_params
      params.require(:status).permit(:name)
    end
end
