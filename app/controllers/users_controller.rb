class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), success: '更新に成功しました。'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :profile_image, :position)
  end
end
