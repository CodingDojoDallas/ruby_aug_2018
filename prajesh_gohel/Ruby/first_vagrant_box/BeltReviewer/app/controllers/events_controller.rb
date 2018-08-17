class EventsController < ApplicationController
  layout "half_column", only: :edit
  def index
    @state_events = Event.where(state: current_user.state)
    @other_events = Event.where.not(state: current_user.state)
  end

  def create
    new_event = Event.create(event_params.merge({user_id: current_user.id}))
    if new_event.valid?
      redirect_to "/events"
    else
      flash[:errors] = new_event.errors.full_messages
      redirect_to "/events"
    end
  end

  def show
    @event = Event.find(params[:id])
    @comments = Comment.where(event_id: params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    edit_event = Event.find(params[:id])
    edit_event.update(event_params)
    unless edit_event.valid?
      flash[:errors] = edit_event.errors.full_messages
      redirect_to "/events/#{edit_event.id}/edit"
    else
      redirect_to "/events/#{edit_event.id}"
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to "/events"
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :city, :state)
    end
end
