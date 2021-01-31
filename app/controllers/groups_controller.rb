class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    @group.add_user(current_user)
    if @group.save
      redirect_to group_path(@group), notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def index
    @my_groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @group_users = @group.group_users


    # もし、すでにグループに存在しているユーザーであれば
    # noticeですでに

  end

  def confirm
    @user = User.find_by(email: params[:email])
    @group = Group.find(params[:id])

    @group_user = GroupUser.where(user_id: @user.id).where(group_id: @group.id)

    if @group_user.present?
      redirect_back(fallback_location: root_path, notice: "#{@user.name}さんはすでに登録済みです")
    end

    unless @user.present?
      redirect_back(fallback_location: root_path, notice: "メールアドレス: #{params[:email]} のメンバーは見つかりません")

    end
  end

  def update
    @user = User.find(params[:user_id])
    group = Group.find(params[:id])

    if group.add_user(@user)
      redirect_to group_path(group), notice: "#{@user.name}さんをメンバーに追加しました"
    else
     redirect_to group_path(group), notice: "#{@user.name}さんはすでにメンバーに登録されています。"
    end
  end



  private
  def group_params
    params.require(:group).permit(:group_name, :userd, group_users_attributes: [:group, :user])
  end



end
