class SessionsController < ApplicationController
  def new
      #rendering login page
  end
  def create
    # Log User In
    # if authenticate true
    user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if user
      # save user id to session
      session[:user_id] = user.id
      # redirect to user's profile page
      redirect_to "/users/#{user.id}"
    # if authenticate false
    else
      # add an error message -> flash[:errors] = ["Invalid"]
      flash[:errors] = ["Invalid Combination"]
      # redirect to login page
      redirect_to :back
    end
    # if user && user.authenticate(params[:password])
  end
  def destroy
    # Log User out
    # set session[:user_id] to null
    session[:user_id] = nil
    # redirect to login page
    redirect_to "/"
  end
end
