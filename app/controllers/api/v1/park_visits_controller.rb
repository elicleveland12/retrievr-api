class Api::V1::ParkVisitsController < ApplicationController
  before_action :find_park_visit, only: [:update, :destroy, :show]
  before_action :authorized, only: [:show, :update, :destroy]

  def index
    @parkVisits = ParkVisit.all
    render json: @parkVisits
  end

  def show
    render json: @parkVisit, status: :ok
  end

  def create
    @parkVisit = ParkVisit.find_by(park_id: params[:park_id], pet_id: params[:pet_id])
    if @parkVisit 
      @parkVisit.update(count: @parkVisit.count + 1, time_in: Time.now, is_active: true)
    else 
      @parkVisit = ParkVisit.new(park_visit_params)
      @parkVisit.count = 1
      @parkVisit.time_in = Time.now
      @parkVisit.is_active = true
      @parkVisit.save 
    end 

    if @parkVisit.save || @parkVisit.update 
        render json: @parkVisit, status: :created
      else
        render json: { errors: @parkVisit.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @parkVisit.update(park_visit_params)
    if @parkVisit.save
      render json: @parkVisit, status: :accepted
    else
      render json: { errors: @parkVisit.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @parkVisit.destroy
    render json: @parkVisit, status: :deleted
  end

  def top_dogs
    @topDogs = ParkVisit.where(park_id: params[:park_id]).order(count: :desc).limit(3)
    render json: @topDogs, user_id: params[:user_id]
  end

  def active_in_park
    @activeInPark = ParkVisit.where(park_id: params[:park_id], is_active: true).order(time_in: :asc)
    render json: @activeInPark
  end

  def check_out_of_park
    pet_ids = params[:pet_ids]
    ParkVisit.where(pet_id: pet_ids, is_active: true).update_all(is_active: false)
    render json: {message: "Checked out of park", pet_ids: params[:pet_ids]}, status: :accepted
  end 

  private

  def park_visit_params
    params.permit(:park_id, :pet_id, :is_active, :time_in, :count, :user_id, :pet_ids)
  end

  def find_park_visit
    @parkVisit = ParkVisit.find(params[:id])
  end
end
