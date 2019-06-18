class StudentsController < ApplicationController
  before_action :set_group
  before_action :set_group_student, only: [:show, :update, :destroy]

  # GET /groups/:group_id/students
  def index
    json_response(@group.students)
  end

  # GET /groups/:group_id/students/:id
  def show
    json_response(@student)
  end

  # POST /groups/:group_id/students
  def create
    @group.students.create!(student_params)
    json_response(@group, :created)
  end

  # PUT /groups/:group_id/students/:id
  def update
    @student.update(student_params)
    head :no_content
  end

  # DELETE /groups/:group_id/students/:id
  def destroy
    @student.destroy
    head :no_content
  end

  private

  def student_params
    params.permit(:name)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_group_student
    @student = @group.students.find_by!(id: params[:id]) if @group
  end
end
