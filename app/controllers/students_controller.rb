class StudentsController < ApplicationController
  before_action :authenticate_user!


  # GET /groups/:group_id/students
  def index
    @students = Student.all
    if student_params[:group_id].present?
      @students = Group.find(params[:group_id]).students
    end
    json_response(@students)
  end

  # GET /students/:id
  def show
    json_response(set_stud)
  end

  # POST /students
  def create
    @student = Student.create!(student_params)
    json_response(@student, :created)
  end

  # PUT /groups/:group_id/students/:id
  def update
    set_stud.update(student_params)
    head :no_content
  end

  # DELETE /groups/:group_id/students/:id
  def destroy
    set_stud.destroy
    head :no_content
  end

  private

  def student_params
    params.permit(:name, :surname, :father_name, :date_of_birth, :group_id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_stud
    @student = Student.find(params[:id])
  end

end
