class UsersController < ApplicationController
  def root
    redirect_to '/users'
  end

  def index
    render json: User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(first_name:params[:first_name], last_name:params[:last_name])

    if !@user.valid?
      flash[:error] = "You have errors"
      redirect_to '/users/new'
    else
      flash[:success] = "You did it!"
      redirect_to '/users'
    end
  end

  def total
    @user = User.all
  end

end
