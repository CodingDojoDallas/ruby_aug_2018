class DojosController < ApplicationController
  def root
    redirect_to '/dojos'
  end

  def index
    @dojos = Dojo.all
  end

  def new
  end

  def create
    @dojo = Dojo.create(branch:params[:branch], street:params[:street], city:params[:city], state:params[:state],)

    if !@dojo.valid?
        flash[:error] = "Please fix the errors !"
        redirect_to '/dojos/new'
    else
        flash[:success] = "Successfully created !"
        redirect_to '/dojos'
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def destroy
    @dojo = Dojo.find(params[:id]).destroy
    redirect_to '/dojos'
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    @dojo.update(user_params)
    if !@dojo.valid?
        flash[:error] = "Try again. You have errors !"
        redirect_to '/dojos/<%= @dojo.id %>/edit'
    else
        flash[:success] = "Succesfully edited!"
        redirect_to '/dojos'
    end
  end

  private
    def user_params
      params.require(:dojo).permit(:branch, :city, :state)
    end

end
