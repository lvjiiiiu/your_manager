require 'rails_helper'

RSpec.describe "Userモデルのテスト", type: :model do
# RSpec.describeはテストのグループ化を宣言
  describe "バリデーションのテスト" do
    let(:user) { build(:user)}
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do           # it はテストを 1つのexample をまとめる役割をする
        test_user.name = ''
        is_expected.to eq false;
      end
    end
    context 'emailカラム' do
    let(:test_user) { user }
      it '空欄でないこと' do
        test_user.email = ''
        is_expected.to eq false;
      end
    end
  end
  
  
  describe 'アソシエーションのテスト' do
    context 'Taskモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:tasks).macro).to eq :has_many
      end
    end
  end
end

# describeの中には複数のexampleがかける
# describe以外にもcontextを使用してテストをグループ化できる
# contextは条件を分けるときなどに使う

# before + @変数 を使用した場合
  # before do
  #   @params = { name: 'たろう' }
  # end

# letを使用した場合→遅延評価される
# let(:params) { { name: 'たろう' } }


# subject

# subjectを使用しない場合
# expect(user.greet).to eq '僕はたろうです。'


# subjectを使用する場合
# subject { user.greet }
# ：
# is_expected.to eq '僕はたろうです。'
