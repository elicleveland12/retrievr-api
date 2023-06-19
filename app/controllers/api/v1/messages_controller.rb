class Api::V1::MessagesController < ApplicationController
    before_action :find_message, only: [:update, :show, :destroy]
    

  def index
    @messages = Message.all
    render json: @messages
  end

  def show
    render json: @message
  end

  def create
    @message = Message.create(message_params)
    render json: @message, status: :created
  end

  def update
    @message.update(message_params)
    render json: @message, status: :ok
  end

  def destroy
    @message.destroy
    render json: @message, status: :deleted
  end

  def get_poster_messages
    @messages = Message.where(poster_id: params[:poster_id])
    render json: @messages, status: :ok
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.permit(:message, :poster_id, :user_id)
  end
end
