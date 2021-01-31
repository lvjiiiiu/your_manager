class Group < ApplicationRecord
  validates :group_name, presence: true

  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users
  def add_user(user)
    @group_user = GroupUser.new(group: self, user: user)
    @group_user.save
  end
end
