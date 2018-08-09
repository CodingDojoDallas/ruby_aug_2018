class UserController < ApplicationController
  def index
    if session[:count].nil?
      session[:count] = 0
    end
  end

  def submit_survey
    session[:survey_form] = survey_params
    flash[:success] = "Thanks for submitting this form! You have submitted this form #{8} times now"
    redirect_to "/user/success"
  end

  def success
    session[:count] = 1
    p session[:count]
    render "success"
  end

  private
  def survey_params
    params.require(:survey).permit(:name, :location, :language, :comment)
  end
end
