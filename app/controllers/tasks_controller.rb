class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: :index
  before_action :sidebar_index, except: :change_matrix

  def index
    tasks_each_matrix
  end

  def new
    @task = Task.new
    @matrix = params[:matrix]
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    @task.task_matrix = if params['task'][:matrix] == '1'
                          '重要で緊急でない'
                        elsif params['task'][:matrix] == '0'
                          '重要かつ緊急'
                        elsif params['task'][:matrix] == '3'
                          '重要でないかつ緊急でない'
                        else
                          '重要でなく緊急'
                        end
    unless @task.save
      @matrix = params['task'][:matrix]
      render 'new'
    end

    @tasks = Task.where(user_id: current_user)
    tasks_each_matrix
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    render 'edit' unless @task.update(task_params)

    @tasks = Task.where(user_id: current_user)
    tasks_each_matrix
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    @tasks = Task.where(user_id: current_user)
    tasks_each_matrix
  end

  def change_matrix
    @task = Task.find(params[:id])
    if @task.user == current_user
    @task.task_matrix = if params[:matrix_id] == 'sortable_task_0'
                          '重要かつ緊急'

                        elsif params[:matrix_id] == 'sortable_task_1'
                          '重要で緊急でない'

                        elsif params[:matrix_id] == 'sortable_task_2'
                          '重要でなく緊急'

                        else
                          '重要でないかつ緊急でない'
                        end
    @task.save
    @user = current_user
    else
      @alert_message = "他の人のタスクは編集できません"
      render 'tasks/alert_message'
    end
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :task_title, :task_details, :start_date, :end_date, :task_status,
                                 :task_matrix)
  end

  def tasks_each_matrix
    @user = User.find(params[:user_id])
    @tasks_important_no_urgent = Task.where(user_id: @user, task_matrix: '重要で緊急でない')
    @tasks_important_urgent = Task.where(user_id: @user, task_matrix: '重要かつ緊急')
    @tasks_no_important_no_urgent = Task.where(user_id: @user, task_matrix: '重要でないかつ緊急でない')
    @tasks_no_important_urgent = Task.where(user_id: @user, task_matrix: '重要でなく緊急')
  end

  def sidebar_index

    @user = User.find(params[:user_id])
    if @user.profile_image_id.present?
      @user_image_url = "https://your-manager.s3-ap-northeast-1.amazonaws.com/store/" + @user.profile_image_id
    else
      @user_image_url = "user_missing.png"
    end
    @routine_tasks = RoutineTask.where(user_id: @user.id)
  end

  def ensure_correct_user
    # parmasでuser_idを取得(URLで遷移しようとしているユーザーのid)
    # URLに入力されたユーザーが所属しているグループ一覧を取得するために
    # group_usersテーブルよりparamsで取得したuser_idをもつグループを配列で取得しjoin_groupsへ格納
    # join_groupsを展開してgroup_usersテーブルよりjoin_groupのgroup_idをもつユーザーを配列で取得しcolleague_usersへ格納 (このとき、重複するものがあればまとめる)
    # colleague_usersの中にcurrent_userがいるか判定する
    unless User.find_by(id: params[:user_id]) == current_user
      unless User.find_by(id: params[:user_id]).nil?
        byebug
        user = User.find(params[:user_id])
        join_groups = GroupUser.where(user_id: user.id)
        @colleague_users = []
        join_groups.each do |join_group|
          @colleague_users.concat GroupUser.where(group_id: join_group.group_id).to_a
        end
        @users = []
        @colleague_users.each do |colleague_user|
          @users.concat User.where(id: colleague_user.user_id).to_a
        end
        @users.uniq!
  
        unless @users.include?(current_user)
          redirect_to tasks_path(user_id: current_user.id)
        end
      else
        redirect_to tasks_path(user_id: current_user)
      end
    end
  end


end
