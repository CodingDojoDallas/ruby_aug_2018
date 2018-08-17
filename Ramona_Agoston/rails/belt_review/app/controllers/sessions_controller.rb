class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:create]
    def create
        user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
        if user
            session[:id] = user.id
            redirect_to "/events"
        else
            redirect_to "/", notice: "Email and password do not match"
        end
    end

    def destroy
        session[:id] = nil
        redirect_to "/"
    end
end
