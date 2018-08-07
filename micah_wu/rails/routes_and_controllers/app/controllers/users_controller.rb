class UsersController < ApplicationController
    def index
        #with rails it defaults to render index.html.erb automatically 
    end

    def say
        render text: "What do you want me to say???"
    end

    def hello
        render text:"Hello Coding Dojo!"
    end

    def sayhello
        render text: "Saying Hello!"
    end

    def joe
        render text:"Saying Hello Joe!"
    end

    def michael
        redirect_to "/say/hello/joe"
    end

    def times
        if session[:counter].nil?
            session[:counter] = 0
        end
        session[:counter] += 1
        render text: "You visited this url #{session[:counter]} time"
    end

    def reset
        session.clear
        render text:"Destroyed the session!"
    end
end
