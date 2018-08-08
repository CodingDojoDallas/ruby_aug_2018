class StudentsController < ApplicationController

  # layout "dojos", only: [:show, :edit]

  def new
    @dojo = Dojo.find(params[:dojo_id])
    @all_dojos = Dojo.where.not(id: params[:dojo_id])
  end

  def create
    new_student = Student.create(student_params)
    unless new_student.valid?
      flash[:notice] = new_student.errors.full_messages
      redirect_to "/dojos/#{params[:dojo_id]}/students/new"
    else
      redirect_to "/dojos/#{new_student.dojo_id}"
    end
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @all_students = Student.where("dojo_id = ? AND DATE(created_at) = ?", params[:dojo_id], @student.created_at.to_date).where.not(id: params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
    @all_dojos = Dojo.where.not(id: params[:dojo_id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    unless student.valid?
      flash[:notice] = student.errors.full_messages
      redirect_to "/dojos/#{params[:dojo_id]}/students/#{params[:id]}/edit"
    else
      redirect_to "/dojos/#{student.dojo_id}/students/#{params[:id]}"
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to "/dojos/#{params[:dojo_id]}"
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end
