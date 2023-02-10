class Api::V1::ParksController < ApplicationController
  before_action :find_user, only: [:update, :destroy, :show]
  before_action :authorized, only: [:show, :update, :destroy]

  def index
    @parks = Park.all
    render json: @parks
  end

  def show
    render json: @park, status: :ok
  end

  def create
    @park = Park.new(park_params)
    if @park.save
        render json: @park, status: :created
      else
        render json: { errors: @park.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @park.update(park_params)
    if @park.save
      render json: @park, status: :accepted
    else
      render json: { errors: @park.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @park.destroy
    render json: @park, status: :deleted
  end

  private

  def park_params
    params.permit(:latitude, :longitude, :address, :name, :description, :hours_sunday, :hours_monday, :hours_tuesday, :hours_wednesday, :hours_thursday, :hours_friday, :hours_saturday, :icon)
  end

  def find_user
    @park = Park.find(params[:id])
  end
end
