class TimesController < ApplicationController
  def index
    unless session[:count]
      session[:count] = 1
    else
      session[:count] += 1
    end
    render text: "You have visited this url #{session[:count]} times"
  end

  def destroy
    session.delete(:count)
    redirect_to "/times"
  end
end
