class UsersController < ApplicationController
  layout "two_column", only: [:index]
  def index
  end

  def create
    new_user = User.create(user_params)
    unless new_user.valid?
      flash[:errors] = new_user.errors.full_messages
      redirect_to root_path
    else
      session[:user_id] = new_user.id
      redirect_to "/events"
    end
  end

  def edit
    render layout: "half_column"
  end

  def update
    edit_user = current_user
    edit_user.update(user_params)
    # edit_user.update_attribute(:first_name, params[:first_name])
    # edit_user.update_attribute(:last_name, params[:last_name])
    # edit_user.update_attribute(:city, params[:city])
    # edit_user.update_attribute(:state, params[:state])
    # edit_user.update_attribute(:email, params[:email])
    unless edit_user.valid?
      flash[:errors] = edit_user.errors.full_messages
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to "/events"
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :date, :city, :state, :password, :password_confirmation)
    end
end
