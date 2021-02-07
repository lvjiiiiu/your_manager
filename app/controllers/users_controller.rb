class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_back(fallback_location: root_path, success: "更新に成功しました。")
    else
      redirect_back(fallback_location: root_path, warning: "保存に失敗しました。")
    end
  end

  private
  def user_params
  params.require(:user).permit(:email, :name, :introduction, :profile_image, :position)
  end
end
