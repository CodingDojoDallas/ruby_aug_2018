class MessagesController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @messages = Message.includes(:user)
      end

      def create
        @user = User.find(session[:user_id])
        @message = @user.messages.new(message_params)

        if @message.save
          redirect_to :back
        else
          flash[:errors] = @message.errors.full_messages
          redirect_to :back
        end
      end

      private
        def message_params
          params.require(:message).permit(:message)
        end
    end