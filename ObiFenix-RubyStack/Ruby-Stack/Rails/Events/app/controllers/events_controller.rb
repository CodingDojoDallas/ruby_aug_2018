class EventsController < ApplicationController
  def index
    @events = Event.where(state: current_user.state)
    @otherevents = Event.where.not(state: current_user.state)
    @attends = Attend.all
  end

  def create
    @new_event = Event.create(event_params.merge(user_id:current_user.id))
    unless @new_event.valid?
      flash[:errors] = @new_event.errors
    end
    redirect_to "/events"
  end

  # ======================
  # GET Request [.html]
  # GET Request [.json]
  # ======================
  def show
    print "\n\n===============================\n\n"
    puts "BEFORE"
    print "\n\n===============================\n\n"
    @this_event = Event.find(id=params[:id])
    @host = "#{@this_event.user.first_name} #{@this_event.user.last_name}"
    @attends_count = Attendee.where("event_id = '#{params[:id]}'").count
    @attendees = Attendee.where("event_id = '#{params[:id]}'")
    # @comments = Comment.joins(:event).where(event_id: @event.id)
  end


  # ======================
  # DELETE Request [.html]
  # DELETE Request [.json]
  # ======================
  def destroy
    User.find(params[:id]).delete
    # reset_session
    redirect_to event_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :city, :state)
    end
end
