class UsersController < ApplicationController
#with rails it defaults to render index.html.erb automatically 
    def index
        render json: User.all
    end

    def new
        render "users/index"
    end
    
    def create
        @user = User.create(name:params[:name])
        redirect_to "/users"
        puts @user
    end

    def show
        render json: User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        render "users/edit"
    end

    def total
        @total = User.count
        render text: "The count is #{@total}"
    end


end
