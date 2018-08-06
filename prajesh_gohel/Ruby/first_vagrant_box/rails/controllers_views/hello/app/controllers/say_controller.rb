class SayController < ApplicationController
  def index
    render text: "What do you want me to say?"
  end

  def show
    if params[:name] == "joe"
      render text: "Saying hello, Joe!"
    elsif params[:name] == "michael"
      redirect_to "/say/hello/joe"
    else render text: "Saying hello"
    end
  end
end
