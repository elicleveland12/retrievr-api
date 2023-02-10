class Api::V1::TagsController < ApplicationController
  before_action :find_tag, only: [:update, :show, :destroy]
  before_action :authorized, only: [:update, :destroy]

  def index
    @tags = Tag.all
    render json: @tags
  end

  def show
    if @tag.pet_id
      redirect_to "http://retrievr-api-v2.herokuapp.com/profile/#{@tag.pet_id}"
    else
      redirect_to "http://retrievr-api-v2.herokuapp.com/missing-posters"
    end
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
    params.permit(:active, :pet_id, :park_id, :tag_type)
  end
end
