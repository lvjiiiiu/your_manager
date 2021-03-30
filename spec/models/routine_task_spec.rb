require 'rails_helper'

RSpec.describe "RoutineTaskのモデルテスト", type: :model do
  describe "Validationのテスト" do
    let(:user) { create(:user) }
    let!(:routine_task) { build(:routine_task, user_id: user.id) }
    context "routine_task_nameカラム" do
      it "空欄でないこと" do
        routine_task.routine_task_name = " "
        expect(routine_task.valid?).to eq false;
      end 
    end
  end
end

