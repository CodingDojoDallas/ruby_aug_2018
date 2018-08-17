class CommentsController < ApplicationController
    def create
        event = Event.find(params[:id])
        comment = Comment.new(comment: params[:comment], event: event, user: current_user)
        unless comment.save
            flash[:errors] = comment.errors.full_messages
        end
        redirect_to("/events/#{params[:id]}")
    end
end
