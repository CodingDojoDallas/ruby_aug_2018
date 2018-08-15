class SessionsController < ApplicationController
  def create
    verify_user = User.find_by(session_params)
    unless verify_user && verify_user.authenticate(params[:password])
      flash[:errors] = ["Login failed, please check your email or password"]
      redirect_to root_path
    else
      session[:user_id] = verify_user.id
      redirect_to "/events"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(:email)
    end
end
