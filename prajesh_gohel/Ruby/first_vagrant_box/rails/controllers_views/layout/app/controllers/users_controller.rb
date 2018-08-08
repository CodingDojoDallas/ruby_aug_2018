class UsersController < ApplicationController
  layout "two_column"
  def index
    @all_users = User.all
  end

  def create
    new_user = User.create(user_params)
    unless new_user.valid?
      flash[:notice] = new_user.errors.full_messages
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :language)
    end
end
