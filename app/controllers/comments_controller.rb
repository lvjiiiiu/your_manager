class CommentsController < ApplicationController



    def create
    @comment = Comment.new(comment_params)
    @comment.save
    @task = @comment.task
    end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    @task = comment.task
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :task_id, :user_id)
  end
end
