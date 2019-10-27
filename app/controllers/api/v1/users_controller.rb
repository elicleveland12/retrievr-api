class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: [:update, :destroy, :show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user, status: :OK
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
      render json: @user, status: :OK
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :phone, :location, :finder_radius)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
