class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new]

  def new
    @user=User.new
    session[:form] = "login"
  end

  # def switch
  #   if session[:form] === "login"
  #     session[:form] = "register"
  #     redirect_to users_new
  #   else
  #     session[:form] = "login"
  #   end
  #   redirect_to "/"
  # end

  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def login
      @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      respond_to do |format|
        if @user
          session[:user_id] = @user.id
          format.html { redirect_to "/users/#{@user.id}}", notice: 'User was successfully logged in!' }
          format.json { render :profile, status: :created, location: @user }
        else
          format.html { redirect_to root_path(@user.errors), alert: 'Invalid login information!' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  # ======================
  # DELETE /user/:id
  # DELETE /user/:id.json
  # ======================
  def logout
    reset_session
    redirect_to root_path
  end

  private
  # Sanatizes/Validates Form Parameters...
    def form_params
      params.require(:user_form).permit(:name, :email, :password)
    end
  end
