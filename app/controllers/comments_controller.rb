class CommentsController < ApplicationController
   before_action :authenticate_user!

    def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    @task = @comment.task
    @task.create_notification_comment!(current_user, @comment.id)
    end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    @task = comment.task
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :task_id)
  end
end
