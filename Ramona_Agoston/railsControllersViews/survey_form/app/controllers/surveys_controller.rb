class SurveysController < ApplicationController
    def redirect
      redirect_to '/surveys'
    end

  def surveys
    session[:name] = params[:name]
    session[:location] = params[:location]
    session[:language] = params[:language]
    session[:comment] = params[:comment]

    redirect_to '/surveys/results'
  end

  def display
    if session[:count]
        session[:count] += 1
    else
        session[:count] = 0
    end
    render 'dasboard'
  end

end
