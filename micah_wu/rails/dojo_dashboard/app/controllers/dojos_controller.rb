class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def create
    unless @dojos.valid?
      flash
    else
      @dojos = Dojo.create( branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
      redirect_to '/dojos'
  end
  
  def show
    @dojo = Dojo.find(params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id]).update(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
    redirect_to '/dojos'
  end

  def delete
    Dojo.find(params[:id]).delete
    redirect_to '/'
  end
end
