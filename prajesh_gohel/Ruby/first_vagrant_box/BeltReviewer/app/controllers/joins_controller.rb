class JoinsController < ApplicationController
  def create
    new_join = Join.create(user_id: current_user.id, event_id: params[:event_id])
    redirect_to "/events"
  end

  def destroy
    join = Join.find(params[:id])
    join.destroy
    redirect_to "/events"
  end
end
