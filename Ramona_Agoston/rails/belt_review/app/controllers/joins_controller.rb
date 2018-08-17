class JoinsController < ApplicationController
    def create
        event = Event.find(params[:id])
        if event
            Join.create(user: current_user, event: event)
        end
        redirect_to "/events"
    end

    def destroy
        event = Event.find(params[:id])
        if event
            join = Join.find_by(user: current_user, event: event)
            if join
                join.destroy
            end
        end
        redirect_to "/events"
    end
end
