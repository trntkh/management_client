class RequestsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end
  
  def calendar
    start_time = params.fetch(:start_time, Date.today).to_datetime
    @requests = Request.all
  end

  def new
    @request = Request.new
    @request.start_time = Date.today
    @request.end_time = Date.today
  end
  
  def edit
    @request = Request.find(params[:id])
  end
   
  def create
    total_days = (request_params[:end_time].to_date - request_params[:start_time].to_date).to_i + 1
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    @request.total_days = total_days
    @request.point = total_days
    if @request.save
      redirect_to @request
    else
      render 'new'
    end
  end

  def update
    @request = Request.find(params[:id])
    total_days = (request_params[:end_time].to_date - request_params[:start_time].to_date).to_i + 1
    @request.total_days = total_days
    if @request.update(request_params)
      redirect_to @request
    else
      render 'edit'
    end
  end
   
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
   
    redirect_to requests_path
  end

  private
  def request_params
    params.require(:request).permit(:admin_id, :start_time, :end_time, :total_days, :shift_time, :reason, :status, :name, :point)
  end
end