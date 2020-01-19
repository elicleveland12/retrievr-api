class Api::V1::PetsController < ApplicationController
  before_action :find_pet, only: [:update, :show, :destroy]
  before_action :authorized

  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    render json: @pet
  end

  def create
    @pet = Pet.create(pet_params)
    @pet.image.attach(io: image_io, filename: image_name)
    render json: @pet, status: :created
  end

  def update
    @pet.update(pet_params)
    if params[:image]
      @pet.image.attach(io: image_io, filename: image_name)
    end
    render json: @pet, status: :OK
  end

  def destroy
    @pet.destroy
    render json: @pet, status: :deleted
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.permit(:name, :birthdate, :breed, :missing, :user_id, :instagram, :posters_id, :found, :sold, :adopted, :species, :fixed, :price, :health, :sex, :number, :litter_id, :breed_primary, :breed_secondary, :mixed, :unknown, :color_primary, :color_secondary, :color_tertiary, :size)
  end

  def image_io
    decoded_image = Base64.decode64(params[:image])
    StringIO.new(decoded_image)
  end

  def image_name
    params[:file_name]
  end

end
