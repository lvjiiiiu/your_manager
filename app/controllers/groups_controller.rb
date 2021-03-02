class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :update, :destroy, :confirm, :destroy_confirm, :withdrawal_confirm, :withdrawal]

  def index
    @my_groups = current_user.groups
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    @group.admin_user = current_user.id
    @group.add_user(current_user)

    if @group.save
      redirect_to group_path(@group), notice: '新しいグループを作成しました。'
    else
      @my_groups = current_user.groups
      @group = Group.new
      @group.users << current_user
      flash.now[:warning] = 'グループ名を入力してください。'
      render 'index'
    end
  end

  def show
    # byebug
    @group = Group.find(params[:id])
    @group_users = @group.group_users
  end

  def confirm
    # Emailが入力されているか
    if params[:email].present?

      @user = User.find_by(email: params[:email])

      # 入力されたEmailのuserは存在するか
      if @user.present?

        @group = Group.find(params[:id])
        @group_user = GroupUser.where(user_id: @user.id).where(group_id: @group.id)

        # 入力されたEmailのuserがすでに存在しないか
        if @group_user.present?
          @group = Group.find(params[:id])
          @group_users = @group.group_users
          flash.now[:warning] = "#{@user.name}さんはすでに登録済みです"
          render 'show'
        end
      else
        @group = Group.find(params[:id])
        @group_users = @group.group_users
        flash.now[:warning] = "メールアドレス: #{params[:email]} のメンバーは見つかりません。"
        render 'show'
      end

    else
      @group = Group.find(params[:id])
      @group_users = @group.group_users
      flash.now[:warning] = '登録したいメンバーのメールアドレスを入力してください'
      render 'show'
    end
  end

  def update
    @user = User.find(params[:user_id])
    group = Group.find(params[:id])

    if group.add_user(@user)
      user_action = "group_join"
      remove_group_name = nil
      group.create_notification!(current_user, group.id, @user, user_action, remove_group_name)
      redirect_to group_path(group), success: "#{@user.name}さんをメンバーに追加しました"
    else
      redirect_to group_path(group), warning: "#{@user.name}さんはすでにメンバーに登録されています。"
    end
  end

  def destroy_confirm
    @group = Group.find(params[:id])
  end

  def destroy
    group = Group.find(params[:id])

    if group.admin_user == current_user.id
      user_action = "group_destroy"
      remove_group_name = group.group_name
      group.create_notification!(current_user, group.id, current_user, user_action, remove_group_name)
      group.destroy
      redirect_to groups_path, success: "#{group.group_name}は削除されました。"
    else
      redirect_to groups_path, danger: "#{group.group_name}の削除権限がありません(※グループはグループの作成者しか削除できません)。"
    end
  end

  def withdrawal_confirm
    @group = Group.find(params[:id])
  end

  def withdrawal
    group = Group.find(params[:id])
    group_user = GroupUser.find_by(group_id: group, user_id: current_user)

    if group_user.destroy
      user_action = "group_withdrawal"
      remove_group_name = nil
      group.create_notification!(current_user, group.id, current_user, user_action, remove_group_name)
      redirect_to groups_path, success: "#{group.group_name}から退会しました。"
    else
      redirect_to group_path(group), warning: "#{group.group_name}から退会できませんでした。"
    end
  end

  private

  def group_params
    params.require(:group).permit(:group_name, :user)
  end

  def ensure_correct_user
    unless Group.find_by(id: params[:id]).nil? 
      @group = Group.find(params[:id])
      @group_user = GroupUser.where(group_id: @group.id)
      unless @group_user.where(user_id: current_user).present?
        redirect_to groups_path
      end
    else
      redirect_to groups_path
    end 
  end

end
