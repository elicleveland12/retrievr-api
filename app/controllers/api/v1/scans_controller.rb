class Api::V1::ScansController < ApplicationController
  before_action :find_scan, only: [:update, :destroy, :show]
  before_action :authorized, only: [:create, :show, :update, :destroy]

  ScanReducer = Rack::Reducer.new(
    Scan.all,
    ->(user_id:) { where(user_id: user_id)  },
    ->(tag_id:) { where(tag_id: tag_id) },
  )

  def index
    @scans = ScanReducer.apply(params)
    @scans = @scans.order(count: :desc)
    render json: @scans
  end

  def show
    render json: @scan, status: :ok
  end

  def create
    @tag = Tag.find(params[:tag_id])
    @scan = Scan.find_by(tag_id: params[:tag_id], user_id: params[:user_id])

    if @scan
      @scan.increment!(:count)
    else 
      @scan = Scan.new(scan_params)
      @scan.count = 1
      @scan.save 
    end 

    if @scan.save || @scan.update
        render json: { scan: @scan, tag: @tag }, status: :created
      else
        render json: { errors: @scan.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @scan.update(scan_params)
    if @scan.save
      render json: @scan, status: :accepted
    else
      render json: { errors: @scan.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @scan.destroy
    render json: @scan, status: :deleted
  end

  private

  def scan_params
    params.permit(:user_id, :tag_id, :count)
  end

  def find_scan
    @scan = Scan.find(params[:id])
  end

end
