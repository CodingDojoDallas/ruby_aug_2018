class SaysController < ApplicationController
  def index
    render text: "What do you want me to say???"
  end

  def hello
    render text:"Hello Coding Dojo!"
  end

  def sayhello
    if params[:name].downcase === 'joe'
      render text:"Saying Hello Joe!"
    elsif params[:name].downcase === 'michael'
      redirect_to "/say/hello/joe"
    else
      render text:"Saying Hello!"
    end
  end

  def times
    if session[:counter].nil?
       session[:counter] = 0
   end
   session[:counter] += 1
   render text: "You visited this url #{session[:counter]} time"
  end

  def restart
    session.clear
    render text:"Destroyed the session!"
  end
end