class EventsController < ApplicationController
    def index
        @state_events = Event.where(state: current_user.state)
        @other_events = Event.where.not(state: current_user.state)
    end

    def show
        @event = Event.find(params[:id])
        @host = @event.user
        @joiners = @event.users
        @comments = @event.comments
    end

    def create
        event = Event.new(event_params)
        event.user = current_user
        unless event.save
            flash[:errors] = event.errors.full_messages
        end
        redirect_to "/events"
    end

    def edit
        @event = Event.find(params[:id])
        if @event.user != current_user
            redirect_to "/events"
        end
    end

    def update
        event = Event.find(params[:id])
        if event.user != current_user
            redirect_to "/events"
        end
        event.assign_attributes(event_params)
        if event.save
            redirect_to "/events"
        else
            flash[:errors] = event.errors.full_messages
            redirect_to "/events/#{params[:id]}"
        end
    end

    def destroy
        event = Event.find(params[:id])
        if event
            if event.user == current_user
                event.destroy
            end
        end
        redirect_to "/events"
    end

    private
    def event_params
        params.require(:event).permit(:name, :date, :city, :state)
    end
end
