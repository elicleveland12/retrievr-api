class Api::V1::PostersController < ApplicationController
  before_action :find_poster, only: [:update, :show]
  before_action :authorized, only: [:update, :destroy, :nearby_posters]

  def index
    @posters = Poster.all
    render json: @posters
  end

  def show
    render json: @poster
  end

  def create
    @poster = Poster.create(poster_params)
    render json: @poster, status: :created
  end

  def update
    @poster.update(poster_params)
    render json: @poster, status: :ok
  end

  def destroy
    @poster = Poster.find(params[:id])
    @poster.destroy
    render json: @poster, status: :deleted
  end

  def nearby_posters
    current_lat = params[:latitude]
    current_lon = params[:longitude]

    @posters = Poster.near([current_lat, current_lon], 200, :order => "distance")
    render json: @posters
  end

  private

  def find_poster
    @poster = Poster.find(params[:id])
  end

  def poster_params
    params.permit(:latitude, :longitude, :address, :pet_description, :pet_id, :poster_name, :poster_phone, :found_lat, :found_long, :comment, :missing_time, :additional_info, :message_id, :reward, :status, :returned, :returned_state, :returned_comment, :returned_timestamp)
  end
end
