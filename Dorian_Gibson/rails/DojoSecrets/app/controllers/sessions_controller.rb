class SessionsController < ApplicationController
  skip_before_action :require_login
  def new
    # render login page
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/sessions/new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end
end