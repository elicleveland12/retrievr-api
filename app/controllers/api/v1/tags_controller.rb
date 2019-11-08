class Api::V1::TagsController < ApplicationController
  before_action :find_tag, only: [:update, :show, :destroy]
  before_action :authorized, only: [:update, :destroy]

  def index
    @tags = Tag.all
    render json: @tags
  end

  def show
    if params[:origin] == "internal"
      render json: @tag
    else
      if @tag.pet_id
        redirect_to "http://retrievr-api-v2.herokuapp.com/profile/#{@tag.pet_id}"
      else
        redirect_to "http://retrievr-api-v2.herokuapp.com/missing-posters"
      end
    end
  end

  def create
    @tag = Tag.create(tag_params)
    render json: @tag, status: :created
  end

  def update
    @tag.update(tag_params)
    render json: @tag, status: :OK
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
    params.permit(:active, :pet_id, :origin)
  end
end
