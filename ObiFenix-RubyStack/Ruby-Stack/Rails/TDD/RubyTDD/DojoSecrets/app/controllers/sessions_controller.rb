class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new]

  def new
  end

  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else
        flash[:errors] = "Incorrect login information!"
        redirect_to :back
      end
  end

  # ======================
  # DELETE /user/:id
  # DELETE /user/:id.json
  # ======================
  def logout
    reset_session
    redirect_to new_session_path
  end

  private
  # Sanatizes/Validates Form Parameters...
    def form_params
      params.require(:user_form).permit(:name, :email, :password)
    end
  end
