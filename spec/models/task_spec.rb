require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'モデルのテスト' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:task)).to be_valid
    end
  end

  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:task) { build(:task, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        task.task_title = ''
        expect(task.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Task.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Task.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Task.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end

