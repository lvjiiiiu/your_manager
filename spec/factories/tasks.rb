FactoryBot.define do
  factory :task do
    sequence(:task_title) { |n| "TASK#{n}"}
    sequence(:task_details) { |n| "TASK_DETAILS#{n}"}
    
    Task.task_matrices.keys.each do |matrix|
      trait :"#{matrix}" do
        status {matrix}
      end
    end
    association :user
  end
end