class UsersController < ApplicationController
  def new
  end

  def create
    new_user = User.create(user_params)
    if new_user.valid?
      session[:user_id] = new_user.id
      redirect_to "/users/#{new_user.id}"
    else
      flash[:errors] = new_user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @user = current_user
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
