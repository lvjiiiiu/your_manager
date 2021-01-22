class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: params[:user_id])
  end

  def new
    @task = Task.new
    @matrix = params[:matrix]
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if params["task"][:matrix] == "1"
      @task.task_matrix = "重要かつ緊急"
    elsif params["task"][:matrix] == "2"
      @task.task_matrix = "重要で緊急でない"
    elsif params["task"][:matrix] == "3"
      @task.task_matrix = "重要でなく緊急"
    else
      @task.task_matrix = "重要でないかつ緊急でない"
    end
    @task.save
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end



  private
  def task_params
    params.require(:task).permit(:user_id, :task_title, :task_details, :start_date, :end_date, :task_status, :task_matrix)
  end
end
