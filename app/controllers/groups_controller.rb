class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.user_ids = current_user.id
    # @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to edit_user_path(current_user), notice: 'グループを作成しました'
      # 本当はmemberのinvitation pageにとびたい⋯
    else
      render :new
    end
  end

  def index
    @my_groups = current_user.groups
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :user_id)
  end

end
