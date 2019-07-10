class Api::V1::TagsController < ApplicationController

  before_action :find_tag, only: [:update, :show]

  def index
    @tags = tag.all
    render json: @tags
  end

  def show
    render json: @tag
  end

  def create
    @tag = tag.create(tag_params)
    render json: @tag, status: :created
  end

  def update
    @tag.update(tag_params)
    render json: @tag, status: :OK
  end

  def destroy
    @tag = tag.find(params[:id])
    @tag.destroy
    render json: @tag, status: :deleted
  end

  private

  def find_tag
    @tag = tag.find(params[:id])
  end

  def tag_params
    params.permit(:active)
  end
end
