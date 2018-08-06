class DojosController < ApplicationController

  def index
    puts "goodbye"
    puts "yo"
    @dojo = Dojo.all
  end

  def create
    Dojo.create(dojo_params)
    redirect_to "/dojos"
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:id])
    @dojo.update(dojo_params)
    redirect_to "/dojos/#{params[:id]}"
  end

  def destroy
    Dojo.find(params[:id]).destroy
    redirect_to '/dojos'
  end

  private
    def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
