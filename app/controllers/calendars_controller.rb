class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.where(user_id: current_user)
    @user = current_user
    if @user.profile_image_id.present?
      @user_image_url = "https://your-manager.s3-ap-northeast-1.amazonaws.com/store/" + @user.profile_image_id
    else
      @user_image_url = "user_missing.png"
    end
    @routine_tasks = RoutineTask.where(user_id: @user)
  end
end
