class Api::V1::TagsController < ApplicationController
  before_action :find_tag, only: [:update, :show, :destroy]
  before_action :authorized, only: [:update, :destroy]

  def index
    @tags = Tag.all
    render json: @tags
  end

  def show
    render json: @tag, status: :ok
  end

  def create
    @tag = Tag.create(tag_params)
    render json: @tag, status: :created
  end

  def update
    @tag.update(tag_params)
    render json: @tag, status: :ok
  end

  def destroy
    @tag.destroy
    render json: @tag, status: :deleted
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.permit(:id, :active, :pet_id, :tag_type)
  end
end
