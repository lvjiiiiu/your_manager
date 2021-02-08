class RoutineTask < ApplicationRecord
  belongs_to :user
  validates :routine_task_name, presence: true
end
