class RoutinesController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    @routine_tasks = RoutineTask.where(user_id: user)
    @routine_task = RoutineTask.new
  end

  def create

    @routine_tasks = RoutineTask.where(user_id: current_user.id)
    @routine_task = RoutineTask.new(routine_task_params)
    @routine_task.user_id = current_user.id
    if @routine_task.save
      redirect_back(fallback_location: root_path)
    else
      user = current_user
      render "index"
    end
  end

  def destroy
    routine_task = RoutineTask.find(params[:id])
    routine_task.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def routine_task_params
    params.require(:routine_task).permit(:user_id, :routine_task_name)
  end
end
