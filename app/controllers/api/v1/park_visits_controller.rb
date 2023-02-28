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
    @parkVisit = ParkVisit.find_by(park_id: params[:park_id])
    if @parkVisit 
      @parkVisit.update(count: @parkVisit.count + 1)
    else 
      @parkVisit = ParkVisit.new(park_visit_params)
      @parkVisit.count = 1
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

  private

  def park_visit_params
    params.permit(:park_id, :pet_id)
  end

  def find_park_visit
    @parkVisit = ParkVisit.find(params[:id])
  end
end
