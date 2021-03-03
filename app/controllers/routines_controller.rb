class RoutinesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: :index

  def index
    @routine_tasks = RoutineTask.where(user_id: current_user.id)
    @routine_task = RoutineTask.new
  end

  def create
    @routine_tasks = RoutineTask.where(user_id: current_user.id)
    @routine_task = RoutineTask.new(routine_task_params)
    @routine_task.user_id = current_user.id
    if @routine_task.save
      redirect_back(fallback_location: root_path)
    else
      render 'index'
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

  def ensure_correct_user
    unless User.find_by(id: params[:user_id]).nil?
      @user = User.find(params[:user_id])
      unless @user == current_user
        redirect_to routines_path(user_id: current_user.id)
      end
    else
      redirect_to edit_user_path(current_user)
    end
  end

end
