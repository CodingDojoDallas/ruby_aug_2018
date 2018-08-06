require 'date'
class TimesController < ApplicationController
  def main
    @datetime = DateTime.now.strftime("%b %d, %Y %I:%M %p")
  end
end
