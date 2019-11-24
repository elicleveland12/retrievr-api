class Api::V1::DevicesController < ApplicationController
  before_action :find_device, only: [:update, :show, :destroy]
  before_action :authorized

  def index
    @devices = Device.all
    render json: @devices
  end

  def show
    render json: @device, status: :ok
  end

  def create
    @device = Device.create(device_params)
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
    @device.destroy
    render json: @device, status: :deleted
  end

  private

  def device_params
    params.permit(:token, :user_id, :platform)
  end

  def find_device
    @device = Device.find(params[:id])
  end
end
