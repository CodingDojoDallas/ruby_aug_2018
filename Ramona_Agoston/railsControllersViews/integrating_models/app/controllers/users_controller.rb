class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
    render "new"
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def edit
    @user = User.find(params[:id])
    render "edit"
  end

  def create
    @new_user = User.create(user_params)
    redirect_to '/users'
  end

  def update
    # User.update(params[:id], user_params)
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.save
    redirect_to "/users"
  end

  def total
    @user_total = User.all.count
    render text: "There are a total of #{@user_total} users!"
  end
  private
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
