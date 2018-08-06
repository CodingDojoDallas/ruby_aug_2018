class FormController < ApplicationController
  def index
  end

  def submitForm
    session[:count] ? session[:count] += 1 : session[:count] = 1
    session[:name] = params[:name]
    session[:location] = params[:location]
    session[:lang] = params[:lang]
    session[:comment] = params[:comment]
    redirect_to '/result'
  end

  def result
  end
  
end
