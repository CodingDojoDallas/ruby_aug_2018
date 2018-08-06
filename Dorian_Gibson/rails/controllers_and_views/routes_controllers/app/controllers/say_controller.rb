class SayController < ApplicationController
  def index
    render text: 'What do you want me to say?'
  end

  def hello
    render text: 'Saying Hello!'
  end

  def hellodojo
    render text: 'Hello CodingDojo!'
  end

  def helloJoe
    render text: 'Saying Hello Joe!'
  end

  def helloMichael
    redirect_to "/say/hello/joe/"
  end

  def times
    session[:count] ? session[:count] += 1 : session[:count] = 1
    render text: 'You have visited this url %d times' % session[:count]
  end

  def reset
    session.clear
    render text: 'Destroyed the session!'
  end
end
