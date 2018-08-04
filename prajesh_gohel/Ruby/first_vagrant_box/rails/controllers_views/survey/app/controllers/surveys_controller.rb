class SurveysController < ApplicationController
  def index
  end

  def post
    unless session[:count]
      session[:count] = 1
    else session[:count] += 1
    end

    session[:name] = params[:name]
    session[:location] = params[:location]
    session[:language] = params[:language]
    session[:comment] = params[:comment]
    redirect_to result_path
  end

  def result
    flash[:success] = "Thank you for submitting this form! You have submitted this form #{session[:count]} times now."
  end

  def destroy
    session[:name] = nil
    session[:location] = nil
    session[:language] = nil
    session[:comment] = nil
    redirect_to root_path
  end
end
