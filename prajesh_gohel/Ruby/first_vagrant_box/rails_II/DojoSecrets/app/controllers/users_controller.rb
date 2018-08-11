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
  end

  def edit
  end

  def update
    edit_user = current_user
    edit_user.update(user_params)
    if edit_user.valid?
      redirect_to "/users/#{edit_user.id}"
    else
      flash[:errors] = edit_user.errors.full_messages
      redirect_to "/users/#{edit_user.id}/edit"
    end
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to "/users/new"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
