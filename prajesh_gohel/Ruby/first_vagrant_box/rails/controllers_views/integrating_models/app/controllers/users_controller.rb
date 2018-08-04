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
    User.create(name: params[:name])
    redirect_to "/users"
  end

  def total
    render text: "Total amount of users: #{User.all.count}"
  end
end
