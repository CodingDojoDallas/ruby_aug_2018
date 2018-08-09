class SayController < ApplicationController
  def index
    render text: "What do you want me to say???"
  end

  def hello
    render text: "Hello Coding Dojo!"
  end

  def say_hello
    render text: "Saying Hello!"
  end

  def joe
    render text: "Saying Hello Joe!"
  end

  def michael
    redirect_to '/say/hello/joe'
  end

  def times
        if !session[:count]
            session[:count] =0
        elsif session[:count]
            session[:count] += 1
        end
        puts session[:count]
        render text: "You visited this URL #{session[:count]} times."
  end

  def restart
    session[:count] =0
    redirect_to '/times'
  end
end
