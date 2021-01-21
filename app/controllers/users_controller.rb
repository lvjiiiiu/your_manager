class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_back(fallback_location: root_path)
    # redirect_to tasks_path
  end

  def index
    @users = User.all
  end

  private
  def user_params
  params.require(:user).permit(:email, :last_name, :first_name, :profile_image, :position)
  end
end
