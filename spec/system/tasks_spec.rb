require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  describe 'task作成のテスト' do
  let(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:task) { create(:task, user: user, task_matrix: "重要かつ緊急") }
  let!(:task2) { create(:task, user: user2, task_matrix: "重要かつ緊急") }
  before do
  	visit new_user_session_path
  	fill_in "user[email]", with: user.email
  	fill_in "user[password]", with: user.password
  	click_button "Log in"
  end
  
    describe "タスク一覧画面表示のテスト" do
   
      context "表示の確認" do
        before do
          visit tasks_path
        end
        it "作成されたタスクが表示されているか" do
          expect(page).to have_content task.task_title
        end
      end 
    end   
  end
end


# describe "タスク一覧画面のテスト"
# context "表示の確認"
# it "作成されたタスクが表示されているか"
# it "作成されたタスクが正しいマトリクスに表示されているか"



# describe "詳細画面のテスト"
# context '表示の確認'
#   it '削除リンクが存在しているか' 
#   it '編集リンクが存在しているか'
# context 'リンクの遷移先の確認' 
# it '編集の遷移先は編集画面か'
 
# context 'タスクの削除のテスト'
#   it 'タスクの削除'
  
# describe '編集画面のテスト'
# context '表示の確認'
# it '編集前のタイトルと本文がフォームに表示(セット)されている' 
# it '保存ボタンが表示される' 

# context '更新処理に関するテスト' 
# it '更新後のリダイレクト先は正しいか'
 
 
# context '他人のタスク一覧詳細画面の表示を確認'
# it 'Dailytaskの編集リンクが表示されない'
# it "他人のユーザー編集リンクが表示されない"
