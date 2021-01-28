class RoutinesController < ApplicationController

  def index
    user = User.find_by(params[:user_id])
    @routine_task = RoutineTask.new
    @routine_tasks = RoutineTask.where(user_id: user)
  end

  def create
    @routine_tasks = RoutineTask.where(user_id: current_user.id)
    @routine_task = RoutineTask.new(routine_task_params)
    @routine_task.user_id = current_user.id
    @routine_task.save
    redirect_back(fallback_location: root_path)
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
