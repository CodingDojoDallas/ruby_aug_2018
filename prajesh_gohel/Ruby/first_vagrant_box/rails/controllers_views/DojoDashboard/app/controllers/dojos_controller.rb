class DojosController < ApplicationController

  def index
    @dojo = Dojo.all
    # render 'dojos/new'
  end

  def new
  end

  def create
    @new_dojo = Dojo.create(dojo_params)
    unless @new_dojo.valid?
      flash[:notice] = @new_dojo.errors.full_messages
      redirect_to "/dojos/new"
    else
      redirect_to "/dojos"
    end
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def show
    @dojo = Dojo.find(params[:id])
    @students = Dojo.find(params[:id]).students
  end

  def update
    puts "Updating..."
    @dojo = Dojo.find(params[:id])
    @dojo.update(dojo_params)
    unless @dojo.valid?
      puts "Error detected"
      flash[:notice] = @dojo.errors.full_messages
      redirect_to "/dojos/#{params[:id]}/edit"
    else
      puts "redirecting to dojos/#{params[:id]}"
      redirect_to "/dojos/" + params[:id].to_s
    end
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
