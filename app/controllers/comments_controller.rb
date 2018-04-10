class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.message = Message.find(params[:id])
        # @comment.message = Message.first
        @comment.user = User.find(session[:user_id])
        unless @comment.save
            flash[:error] = @comment.errors.full_messages
        end
        redirect_to messages_path
    end

    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
