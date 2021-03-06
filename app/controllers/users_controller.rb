class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def edit
    @user = User.find(params[:id])
    if @user.profile_image_id.present?
      @user_image_url = "https://your-manager.s3-ap-northeast-1.amazonaws.com/store/" + @user.profile_image_id
    else
      @user_image_url = "user_missing.png"
    end
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

  def ensure_correct_user
    unless User.find_by(id: params[:id]).nil?
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to edit_user_path(current_user)
      end
    else
      redirect_to edit_user_path(current_user)
    end
  end
end
