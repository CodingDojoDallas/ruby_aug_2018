class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
  end

  def create
    @dojo = Dojo.create(branch:params[:branch], street:params[:street], city:params[:city], state:params[:state],)

    if !@dojo.valid?
      flash[:error] = "Try again ! You have errors."
      redirect_to '/dojos/new'
    else
      flash[:success] = "Successfully addded!"
      redirect_to '/dojos'
    end
  end
end
