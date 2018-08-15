class MessagesController < ApplicationController
  layout 'main_page'
  def index
    unless session[:username]
      flash[:danger] = "You must sign in first"
      redirect_to users_new_path
    end
    @user = User.where("username = ?", session[:username])
    @messages = Message.all
  end

  def create
    user = User.where("username = ?", session[:username])
    new_message = Message.create(message: params[:message], user_id: user[0].id)
    unless new_message.valid?
      flash[:danger] = "Could not create message"
      redirect_to messages_path
    else
      redirect_to messages_path
    end
  end
end
