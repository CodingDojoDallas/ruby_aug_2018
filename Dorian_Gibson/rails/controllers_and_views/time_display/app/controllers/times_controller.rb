class TimesController < ApplicationController

  def main
    current_time = Time.current
    @date = current_time.strftime "%b %d, %Y %H:%M%P"
  end

end
