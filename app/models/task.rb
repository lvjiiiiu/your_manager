class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :task_title, presence: true

  enum task_status: { 未着手: 0, 進行中: 1, 保留: 2, 確認中: 3, 遅れ: 4, 完了: 5 }
  enum task_matrix: { 重要かつ緊急: 0, 重要で緊急でない: 1, 重要でなく緊急: 2, 重要でないかつ緊急でない: 3 }
  
  
  #通知機能

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(task_id: id).where.not(user_id: current_user.id).distinct

    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      task_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
