class GroupsController < ApplicationController
  
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
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @group_users = @group.group_users
  end

  def confirm
    @user = User.find_by(email: params[:email])
    @group = Group.find(params[:id])
    @group_user = GroupUser.where(user_id: @user.id).where(group_id: @group.id)

    if @group_user.present?
      redirect_back(fallback_location: root_path, warning: "#{@user.name}さんはすでに登録済みです")
    end

    unless @user.present?
      redirect_back(fallback_location: root_path, warning: "メールアドレス: #{params[:email]} のメンバーは見つかりません")
    end
  end

  def update
    @user = User.find(params[:user_id])
    group = Group.find(params[:id])

    if group.add_user(@user)
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
    if group.admin_user = current_user
      group.destroy
      redirect_to groups_path, success: "#{group.group_name}は削除されました。"
    else
      redirect_to groups_path, danger: "#{group.group_name}の削除権限がありません(※グループはグループの作成者しか削除できません)。"
    end
  end 


  private
  def group_params
    params.require(:group).permit(:group_name, :user)
  end



end