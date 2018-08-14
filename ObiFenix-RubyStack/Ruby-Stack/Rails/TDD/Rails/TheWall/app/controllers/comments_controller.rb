class CommentsController < ApplicationController
    def create
      @user = User.find(session[:user_id])
      @comment = @user.comments.new(validate_params)

      if @comment.save
        redirect_to :back
      else
        flash[:errors] = @comment.errors.full_messages
        redirect_to :back
      end

    end

    private
      def validate_params
        params.require(:comment).permit(:content, :message_id)
      end
  end
