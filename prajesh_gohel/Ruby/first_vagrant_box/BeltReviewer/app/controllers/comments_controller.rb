class CommentsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    new_comment = Comment.create(comment_params.merge({user_id: current_user.id, event_id: params[:event_id]}))
    unless new_comment.valid?
      flash[:errors] = new_comment.errors.full_messages
      redirect_to "/events/#{event.id}"
    else
      redirect_to "/events/#{event.id}"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end
