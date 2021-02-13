class AddRemoveGroupNameToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :remove_group_name, :string
  end
end
