class UsersController < ApplicationController
  def new
    if session[:user_id]
      redirect_to messages_path
    end
  end

  def signin
    @user = User.find_by(validate_params)
    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to messages_path
    else
      flash[:errors] = ["Could not find username"]
      redirect_to :back
    end
  end

  def logout
    reset_session
    redirect_to new_user_path
  end

  private
    def validate_params
      params.require(:user).permit(:username)
    end
end