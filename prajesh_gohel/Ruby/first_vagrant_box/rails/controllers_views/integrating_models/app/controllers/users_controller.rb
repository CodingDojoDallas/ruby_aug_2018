class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def edit
    @user_name = User.find(params[:id]).name
  end

  def create
    User.create(name: post.method('name'))
    redirect_to "/users"
  end
end
