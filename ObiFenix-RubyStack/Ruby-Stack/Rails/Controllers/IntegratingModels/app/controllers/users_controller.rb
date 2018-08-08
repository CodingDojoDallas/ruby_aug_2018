class UsersController < ApplicationController
    # By defaultsRails render index.html.erb automatically
    def index
        render "index"
    end

    def allusers
        render json: User.all
    end

    def new
        # render "new"...  Not needed since it's already being done by RAILS
    end

    def create
        @user = User.create(name: params[:name])
        redirect_to "/users"
    end

    def edit
        @user = User.find(params[:id])
        # render "edit"... Not needed since it's already being done by RAILS
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to "/users/#{params[:id]}"
        else
            render "users/edit"
        end
    end

    def total
        render text: "Total number of users: #{ User.count }"
    end

    private
    def user_params
        params.permit(:id, :name, :created_at, :updated_at)
    end
end
