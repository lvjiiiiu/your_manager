class CalendarsController < ApplicationController

  def index
    @tasks = Task.where(user_id: current_user)
    @user = current_user
    @routine_tasks = RoutineTask.where(user_id: @user)
  end

end
