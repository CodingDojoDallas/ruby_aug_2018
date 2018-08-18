class UsersController < ApplicationController
  # Pre-config
  skip_before_action :require_login, only: [:new]
  before_action :valid_user, only: [:edit, :profile, :update, :destroy]

  # =============================
  # GET Request - Renders [.html]
  # =============================
  def new
    @user = User.new
    session[:form] = "register"
  end

  def profile
    @mysecrets = User.find(current_user).secrets
    p current_user
  end

  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def register
    # First Check if user is alrady logged in...!
    if @user == User.find_by_email(:email)
      flash[:errors] = "The email provided is already registered"   #CHECK LATER ????
      redirect_to :back

    # Creates/Registers a new user
    else
      if params[:password] == params[:conf_password]
        @user = User.create(valid_form_params)
        respond_to do |format|
          if @user.save
            session[:user_id] = @user.id
            p session[:user_id]
            # redirect_to new_session_path
            format.html { redirect_to "/users/#{@user.id}", notice: 'User was successfully created.' }
            format.json { render :profile, status: :ok, location: @user }
          else
            redirect_to :back, flash[:errors] = @user.errors.full_messages
          end
        end
      end
    end
  end
  # ===================================================
  # GET Request [.html] | Already being render by rails
  # ===================================================
  def edit
  end

  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def update
    @user = User.find(current_user.id)
    respond_to do |format|
      if @user.update(email: params[:email], name: params[:name])
        format.html { redirect_to "/users/#{@user.id}", notice: 'Student was successfully updated.' }
        format.json { render :profile, status: :ok, location: @user }
      else
        # format.html { render :edit, flash[:errors] = @user.errors.full_messages }
        format.html { redirect_to :back, flash[:errors] = @user.errors.full_messages }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # ======================
  # DELETE Request [.html]
  # DELETE Request [.json]
  # ======================
  def destroy
    User.find(current_user.id)
    reset_session
    redirect_to new_user_path
  end

  private
    def valid_form_params
      params.require(:user).permit(:name, :email, :password)
    end

    def valid_user
      if current_user != User.find(params[:id])
        redirect_to "/users/#{session[:user_id]}"
      end
    end
end
