class RequestsController < ApplicationController
    def index
        @requests = Request.all
    end
     
    def show
        @request = Request.find(params[:id])
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
        @request = Request.new(request_params)
        @request.user_id = current_user.id
        if @request.save
            redirect_to @request
        else
            render 'new'
        end
    end
     
    def update
        @request = Request.find(params[:id])
     
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
        params.require(:request).permit(:admin_id, :start_date, :end_date, :total_days, :shift_time, :reason, :name, :status, :point)
    end
end