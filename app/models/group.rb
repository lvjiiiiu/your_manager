class Group < ApplicationRecord
  validates :group_name, presence: true

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  def add_user(user)
    @group_user = GroupUser.new(group: self, user: user)
    if @group_user.group.group_name.present?
      @group_user.save
    else
    end
  end
end
