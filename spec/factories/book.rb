FactoryBot.define do
  factory :task do
    sequence(:task_title) { |n| "TASK#{n}"}
    sequence(:task_details) { |n| "TASK_DETAILS#{n}"}
    
    user
  end
end