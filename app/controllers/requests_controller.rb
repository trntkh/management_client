class RequestsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end
  
  def calendar
    start_date = params.fetch(:start_date, Date.today)
		start_date = start_date.to_datetime
    @requests = Request.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def new
    @request = Request.new
    @request.start_date = Date.today
    @request.end_date = Date.today
  end
  
  def edit
    @request = Request.find(params[:id])
  end
   
  def create
    total_days = (request_params[:end_date].to_date - request_params[:start_date].to_date).to_i + 1
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
    total_days = (request_params[:end_date].to_date - request_params[:start_date].to_date).to_i + 1
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
    params.require(:request).permit(:admin_id, :start_date, :end_date, :total_days, :shift_time, :reason, :status, :name, :point)
  end
end