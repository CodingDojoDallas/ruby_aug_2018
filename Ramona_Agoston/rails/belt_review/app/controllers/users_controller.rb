class UsersController < ApplicationController
    skip_before_action :require_login, only: [:index, :create]
    def index
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:id] = user.id
            redirect_to "/events"
        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/"
        end
    end

    def show
        if params[:id].to_i != current_user.id
            redirect_to "/events"
        end
        @user = current_user
    end

    def update
        user = current_user
        user.assign_attributes(user_params)
        if user.save
            redirect_to "/events"
        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/users/#{user.id}"
        end
    end
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end
end
