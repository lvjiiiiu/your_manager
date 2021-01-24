class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum task_status: {未着手: 0, 進行中: 1, 保留: 2, 確認中: 3, 遅れ: 4, 完了: 5}
  enum task_matrix: {重要かつ緊急: 0, 重要で緊急でない: 1, 重要でなく緊急: 2, 重要でないかつ緊急でない: 3 }
end
