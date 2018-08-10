class UsersController < ApplicationController
  layout 'sign_in'
  def new
    unless session[:logged_in]
      session[:logged_in] = false
    end
  end

  def verify
    find_user = User.where(username: params[:username])
    if find_user.empty?
      flash[:danger] = "Username not found"
      redirect_to '/users/new'
    else
      session[:username] = params[:username]
      session[:logged_in] = true
      redirect_to messages_path
    end
  end

  def logout
    session[:username] = nil
    session[:logged_in] = false
    redirect_to users_new_path
  end
end
