class Api::V1::BreedersController < ApplicationController
  before_action :find_breeder, only: [:update, :show, :destroy]

  def index
    @breeders = Breeder.all
    render json: @breeders
  end

  def show
    render json: @breeder
  end

  def create
    @breeder = Breeder.create(breeder_params)
    render json: @breeder, status: :created
  end

  def update
    @breeder.update(breeder_params)
    render json: @breeder, status: :ok
  end

  def destroy
    @breeder.destroy
    render json: @breeder, status: :deleted
  end

  private

  def find_breeder
    @breeder = Breeder.find(params[:id])
  end

  def breeder_params
    params.permit(:name, :location, :breeds, :litters_to_date, :verified, :champ_bloodlines)
  end
end
