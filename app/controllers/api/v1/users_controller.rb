class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :destroy, :show]
  before_action :authorized, only: [:show, :update, :destroy, :nearby_users, :set_user_coords]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
        UserMailer.registration_confirmation(@user).deliver
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @user.destroy
    render json: @user, status: :deleted
  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:id])
    if @user
      @user.email_activate
      redirect_to "/verified"
    else
      render json: { errors: "Verification already has been done" }, status: :unprocessible_entity
    end
  end

  def nearby_users
    current_lat = params[:latitude].to_f
    current_lon = params[:longitude].to_f

    @users = User.near([current_lat, current_lon], :finder_radius)
    render json: @users
  end

  def set_user_coords
    @users = User.all
    @users.each { |e|
      loc = JSON.parse(e.location)
      location_params = { :latitude => loc['latitude'], :longitude => loc['longitude'] }
      puts location_params
      e.update(location_params)
    }
    render json: { message: "Ya did it, kid." }, status: :ok
  end

  def ping
    render json: { message: "API status: normal" }, status: :ok
  end 

  private

  def user_params
    params.permit(:id, :name, :email, :password, :phone, :location, :finder_radius, :country, :referral_id, :latitude, :longitude)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
