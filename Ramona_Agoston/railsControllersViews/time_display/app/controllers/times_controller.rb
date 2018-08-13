require 'date'
class TimesController < ApplicationController
  def main
    @date = Time.zone.now.strftime("%b %d, %Y")
    @time = Time.zone.now.strftime("%-I:%M %p")
    render 'main'
  end
end
