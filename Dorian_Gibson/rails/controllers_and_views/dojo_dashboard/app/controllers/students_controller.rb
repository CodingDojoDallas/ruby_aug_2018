class StudentsController < ApplicationController
  

  def new
    @dojo_id = params[:dojo_id]
    puts @dojo_id
  end

  def show
    @student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    puts params
    @dojo = Dojo.find(params[:dojo_id])
    puts @dojo.id, "id of dojo"
    @student = Student.create(dojo:Dojo.find(params[:dojo_id]), first_name:params[:first_name], last_name:params[:last_name], email:params[:email])
    
    if !@student.valid?
      flash[:error] = "You have errors"
      redirect_to :back
    else
      flash[:success] = "You did it!"
      redirect_to '/dojos/%d' % @dojo.id
    end
  end

  def destroy
    @student = Student.find(params[:id]).destroy
    redirect_to :back
  end

  def edit
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def update
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @student.update(user_params)
    if !@student.valid?
      flash[:error] = "You have errors"
      redirect_to :back
    else
      flash[:success] = "You did it!"
      redirect_to '/dojos/%d' % @dojo.id
    end
  end

  private
  def user_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end

end
