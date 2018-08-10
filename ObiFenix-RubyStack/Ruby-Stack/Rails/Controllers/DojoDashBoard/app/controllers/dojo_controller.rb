class DojoController < ApplicationController
  before_action :set_dojo, only: [:show, :edit, :update, :destroy]

  def index
    @alldojos = Dojo.all
  end

  def new
    @dojo = Dojo.new
  end

  def create
    @dojo = Dojo.create(validate_parans)
    @dojo.valid?
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

  def show
    fail
  end

  def edit
    fail
  end

  def update
    fail
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
    def validate_parans
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
