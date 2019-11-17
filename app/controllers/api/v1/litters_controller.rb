class Api::V1::LittersController < ApplicationController
  before_action :find_litter, only: [:update, :show, :destroy]

  def index
    @litters = Litter.all
    render json: @litters
  end

  def show
    render json: @litter
  end

  def create
    @litter = Litter.create(litter_params)
    render json: @litter, status: :created
  end

  def update
    @litter.update(litter_params)
    render json: @litter, status: :OK
  end

  def destroy
    @litter.destroy
    render json: @litter, status: :deleted
  end

  private

  def find_litter
    @litter = Litter.find(params[:id])
  end

  def litter_params
    params.permit(:bitch, :stud, :breed, :due_date, :breeder_id)
  end
end
