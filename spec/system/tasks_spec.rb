require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  describe "タスク一覧画面のテスト" do
    before do 
      visit tasks_path 
    end 
    context "表示の確認" do
      it "作成されたタスクが表示されているか" do
        expect(page).to have_content task.title
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
