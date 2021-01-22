class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: params[:user_id])
  end

  def new
    @task = Task.new
    #respond_to do |format|
    #format.html{}
    #format.js {}
    #end
  end

  def create

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private
  def task_params
    params.require(:task).permit(:user_id, :task_title, :task_details, :start_date, :end_date, :task_status, :task_matrix)
  end
end
