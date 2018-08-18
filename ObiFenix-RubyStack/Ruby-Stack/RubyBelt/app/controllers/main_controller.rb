class MainController < ApplicationController

  before_action :set_user, only: [:first_name, :last_name, :email, :password, :password_confirmation]

  def index
    if current_user
      redirect_to songs_path
    end
    User.new
    @errors = []
  end

  # =============================
  # Switch Controller for Log/Reg
  # =============================
  def switch
    if session[:form] === "login"
      session[:form] = "register"
    else
      session[:form] = "login"
    end
    redirect_to "/"
  end


  # =====================================
  # Handles User Login <users/login> form
  # =====================================
  def login
    @user = User.find_by_email(params[:email])
    if @user and @user.authenticate(params[:password])
      session["user_id"] = @user.id
      redirect_to songs_path
    else
      flash[:errors] = ["Invalid login information!"]
      redirect_to :back
    end
  end


  # ===============================================
  # Handles User Registration <users/register> form
  # ===============================================
  def register
    @user = User.create(user_params)
    unless @user.valid?
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    else
      # @errors = flash@user.errors.full_messages
      # notice: 'User was successfully created.'
      session["user_id"] = @user.id
      redirect_to "/events"
    end
  end


  # =============================
  # GET Request - Renders [.html]
  # =============================
  def new
    @user = User.new
  end


  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def create
    @user = User.create(validate_params)
    respond_to do |format|
      if @user.valid?
        format.html { redirect_to "/", notice: 'User was successfully created.' }
        format.json { redirect_to :back, status: :created, location: @user }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # # =============================
  # # GET Request - Renders [.html]
  # # =============================
  # def show
  #   @user = User.find(params[:id])
  #   @this_song = Dojo.find(params[:dojo_id])
  #   @this_user = "#{@user.first_name} #{@user.last_name}"
  #
  #   # ----------- [ Put in Session ]
  #   session[:page] = "user"
  #   session[:song_id] = @this_song.id
  #   # ------------------------------
  #   # print "\n\n\n=========\n", @dojo
  #   # print "\n\n\n=========\n", @user
  # end


  # =============================
  # GET Request - Renders [.html]
  # =============================
  # def edit
  #   @allsongs = Song.all
  #   @edit_dojo = User.find(params[:dojo_id])
  #   @user = User.find(params[:id])
  #   @this_user = "#{@user.first_name} #{@user.last_name}"
  #
  #   # -------------------------------- [ Put in Session ]
  #   session[:page] = "user"
  #   session[:user_id] = params[:dojo_id]
  #   session[:user_id] = params[:id]
  #   session[:branch] = Dojo.find(params[:dojo_id]).branch
  #   # ---------------------------------------------------
  #   render "edit"
  # end


  # =========================
  # PATCH/PUT Request [.html]
  # PATCH/PUT Request [.json]
  # =========================
  # def update
  #   @user = User.find(params[:id])
  #   respond_to do |format|
  #     if @user.update(validate_params)
  #       # format.html { redirect_to dojo_user_url, notice: 'User was successfully updated.' }
  #       format.html { redirect_to "/users/#{params[:user_id]}/users/#{params[:id]}", notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  # ===============================
  # DELETE request for </logout>
  # >> This shall terminate session
  # ===============================
  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to '/', notice: 'User was successfully logged out.' }
      format.json { head :no_content }
    end
  end


  # ===================
  # DELETE /user/1
  # DELETE /user/1.json
  # ===================
  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      # format.html { redirect_to '/', notice: 'User was successfully destroyed.' }
      format.html { redirect_to "/users/#{params[:user_id]}", notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Sanatizing/Validating Form Parameters...
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
