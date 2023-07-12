class CommentsController < ApplicationController
    def create
        @request = Request.find(params[:request_id])
        @comment = @request.comments.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to request_path(@request)
        else
            redirect_to request_path(@request), notice: "Comment was not created successfully!"
        end
    end

    def destroy
        @request = Request.find(params[:request_id])
        @comment = @request.comments.find(params[:id])
        @comment.destroy
        redirect_to request_path(@request)
    end
     
    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
