class DojoController < ApplicationController
  before_action :set_dojo, only: [:show, :edit, :update, :destroy]

  # GET Request - Renders root/home page [.html]
  def index
    @alldojos = Dojo.all
  end

  # GET Request - Renders [.html]
  def new
    @dojo = Dojo.new
  end

  # POST Request [.html]
  # POST Request [.json]
  def create
    @dojo = Dojo.create(validate_params)
    # @dojo.valid?
    respond_to do |format|
      if @dojo.save
        format.html { redirect_to '/', notice: 'Dojo was successfully created.' }
        format.json { render :show, status: :created, location: @dojo }
      else
        format.html { render :new }
        format.json { render json: @dojo.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET Request - Renders [.html]
  def show
    @dojo = Dojo.find(params[:id])
  end

  # GET Request - Renders [.html]
  def edit
    @dojo = Dojo.find(params[:id])
    render "edit"
  end

  # PATCH/PUT Request [.html]
  # PATCH/PUT Request [.json]
  def update
    respond_to do |format|
      if @dojo.update(validate_params)
        format.html { redirect_to '/', notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @dojo }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    fail
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dojo
      @dojo = Dojo.find(params[:id])
    end

    # Sanatizing/Validating Parameters...
    def validate_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
