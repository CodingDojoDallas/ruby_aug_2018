class TimeController < ApplicationController
  def timer
    @date = Time.current.strftime("%b %d, %Y")
    @time = Time.current.strftime("%I:%M %p")
    render "timer"
  end
end
