class Api::V1::DevicesController < ApplicationController

  before_action :find_device, only: [:update]

  def index
    @devices = device.all
    render json: @devices
  end

  def show
    @device = device.find(params[:id])
    render json: @device, status: :OK
  end

  def create
    @device = device.create(device_params)
    render json: @device, status: :created
  end

  def update
    @device.update(device_params)
    if @device.save
      render json: @device, status: :accepted
    else
      render json: { errors: @device.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @device = device.find(params[:id])
    @device.destroy
    render json: @device, status: :deleted
  end

  private

  def device_params
    params.permit(:token, :token, :platform)
  end

  def find_device
    @device = device.find(params[:id])
  end
end
