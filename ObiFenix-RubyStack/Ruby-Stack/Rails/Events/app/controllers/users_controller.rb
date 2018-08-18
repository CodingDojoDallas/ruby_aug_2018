class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    unless @user.valid?
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    else
      # @errors = flash@user.errors.full_messages
      session["user_id"] = @user.id
      redirect_to "/events"
    end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end
end
