class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: params[:user_id])

    # @tasks.each do |task|
    #   if task.task_matrix = "重要で緊急でない"
    #     @task_important_no_urgent = task.where(task_matrix: "重要で緊急でない")
    #   elsif task.task_matrix = "重要かつ緊急"
    #     @task_important_urgent = task.where(task_matrix: "重要かつ緊急")
    #   elsif task.task_matrix = "重要でなく緊急でない"
    #     @task_no_important_no_urgent = task.where(task_matrix: "重要でなく緊急でない")
    #   else
    #     @task_no_important_urgent = task.where(task_matrix: "重要でなく緊急")
    #   end
    # end



  end

  def new
    @task = Task.new
    @matrix = params[:matrix]
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if params["task"][:matrix] == "1"
      @task.task_matrix = "重要で緊急でない"
    elsif params["task"][:matrix] == "2"
      @task.task_matrix = "重要かつ緊急"
    elsif params["task"][:matrix] == "3"
      @task.task_matrix = "重要でなく緊急でない"
    else
      @task.task_matrix = "重要でなく緊急"
    end
    @task.save
    @tasks = Task.where(user_id: current_user)
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
    @tasks = Task.where(user_id: current_user)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    @tasks = Task.where(user_id: current_user)
  end



  private
  def task_params
    params.require(:task).permit(:user_id, :task_title, :task_details, :start_date, :end_date, :task_status, :task_matrix)
  end
end
