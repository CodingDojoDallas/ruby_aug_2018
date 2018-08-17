class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash[:notice] = ["Welcome, #{@user.first_name}"]
      redirect_to user_path(User.last)
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
