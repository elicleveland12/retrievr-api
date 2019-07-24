class Api::V1::PetsController < ApplicationController
  before_action :find_pet, only: [:update, :show]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    render json: @pet 
  end

  def create
    @pet = Pet.create(name: params[:name],breed: params[:breed], instagram: params[:instagram], birthdate: params[:birthdate], user_id: params[user_id])
    @pet.image.attach(io: image_io, filename: image_nam)
    render json: @pet, status: :created
  end

  def update
    @pet.update(pet_params)
    render json: @pet, status: :OK
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    render json: @pet, status: :deleted
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.permit(:name, :birthdate, :breed, :missing, :image, :user_id, :instagram, :posters_id, :file_name)
  end

  def image_io
    decoded_image = Base64.decode64(params[:image])
    StringIO.new(decoded_image)
  end

  def image_name
    params[:file_name]
  end
  
end
