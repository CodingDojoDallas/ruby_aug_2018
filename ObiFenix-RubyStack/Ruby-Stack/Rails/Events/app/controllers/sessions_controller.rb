class SessionsController < ApplicationController
  def index
    User.new
    @errors = []
  end

  def switch
    if session[:form] === "login"
      session[:form] = "register"
    else
      session[:form] = "login"
    end
    redirect_to "/"
  end


  def create
    @user = User.find_by_email(params[:email])

    if @user and @user.authenticate(params[:password])
      session["user_id"] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = ["Invalid login information!"]
      redirect_to :back
    end
  end


  # ====================
  # DELETE /User/1
  # DELETE /User/1.json
  # ====================
  def destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to '/', notice: 'User was successfully logged out.' }
      format.json { head :no_content }
    end
  end

end
