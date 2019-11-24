class Api::V1::SheltersController < ApplicationController
  before_action :find_shelter, only: [:update, :show, :destroy]

  def index
    @shelters = Shelter.all
    render json: @shelters
  end

  def show
    render json: @shelter
  end

  def create
    @shelter = Shelter.create(shelter_params)
    render json: @shelter, status: :created
  end

  def update
    @shelter.update(shelter_params)
    render json: @shelter, status: :ok
  end

  def destroy
    @shelter.destroy
    render json: @shelter, status: :deleted
  end

  private

  def find_shelter
    @shelter = Shelter.find(params[:id])
  end

  def shelter_params
    params.permit(:name, :location, :donations)
  end
end
