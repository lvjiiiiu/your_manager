FactoryBot.define do
  factory :task do
    sequence(:task_title) { |n| "TASK#{n}"}
    sequence(:task_details) { |n| "TASK_DETAILS#{n}"}
    
    Task.task_matrices.keys.each do |matrix|
      trait :"#{ matrix }" do
        task_matrix { matrix }
      end
    end
    
    # こちらでも良い
    
    # trait :"重要かつ緊急" do
    #   task_matrix { "重要かつ緊急" }
    # end

    # trait :"重要で緊急でない" do
    #   task_matrix { "重要で緊急でない" }
    # end

    # trait :"重要でなく緊急" do
    #   task_matrix { "重要でなく緊急" }
    # end

    # trait :"重要でないかつ緊急でない" do
    #   task_matrix { "重要でないかつ緊急でない" }
    # end
  
  
    association :user
  end
end