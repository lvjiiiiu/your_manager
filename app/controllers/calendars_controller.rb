class CalendarsController < ApplicationController
  before_action :sidebar_index

  def index
    @tasks = Task.where(user_id: current_user)
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save!
    @tasks = Task.where(user_id: current_user.id)
  end

  def update
    task = Task.find(params[:id])
    @tasks = Task.where(user_id: current_user.id)
    task.update(task_params)
  end

  def destroy
    @user = User.find(params[:id])
    task = Task.find(params[:id])
    task.destroy
    redirect_to user_path(@user)
  end

  private
  def task_params
    params.require(:task).permit(:user_id, :task_title, :task_details, :start_date, :end_date, :task_status, :task_matrix)
  end

  def sidebar_index
    @user = current_user
    @routine_tasks = RoutineTask.where(user_id: @user)
  end
end
