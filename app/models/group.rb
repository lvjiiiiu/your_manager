class Group < ApplicationRecord
  validates :group_name, presence: true
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :notifications


  def add_user(user)
    @group_user = GroupUser.new(group: self, user: user)
    @group_user.save if @group_user.group.group_name.present?
  end

  # いつのタイミングで通知が送られる？

  # 通知タイミング：
  # 1. グループにメンバーが追加された時(すでにメンバーであるユーザー&メンバーに追加されたユーザー)
  # 2. チームメンバーが退会したとき
  # 3. チームが削除されたとき
  # チーム新規作成時は作成者一人しかいないから通知はなし

  # 通知内容1　〇〇さんがチーム〇〇に追加されました。
  # 通知内容2　〇〇さんがチーム〇〇より退会しました。
  # 通知内容3　〇〇さんによりチーム〇〇が削除されました。

  #group_userのuserがcreateされたとき →create_notification! (呼び出しはgroup controllerのupdate)
  #group_userのuserがdestroyされたとき →create_notification! (呼び出しはgroup controllerのwithdrawal)
  #groupをdestroyされたとき →create_notification! (呼び出しはgroup controllerのdestroy)

  #createされたnotificationをsave →save_notification!


  # グループメンバー全員分の通知を作成
  def create_notification!(current_user, group_id, active_user, user_action, remove_group_name)
    temp_ids = GroupUser.select(:user_id).where(group_id: id).distinct
    temp_ids.each do |temp_id|
      save_notification!(current_user, group_id, temp_id['user_id'], active_user, user_action, remove_group_name)
    end
  end
  
  # 通知へそれぞれデータを格納し保存
  def save_notification!(current_user, comment_id, visited_id, active_user, user_action, remove_group_name)

    notification = active_user.active_notifications.new(
      group_id: id,
      visited_id: visited_id,
      action: user_action,
      remove_group_name: remove_group_name
    )
    notification.save if notification.valid?
  end
  
end
