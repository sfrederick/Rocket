class StatusesNetworkNames < ActiveRecord::Migration
  def self.up
    rename_column :statuses, :user_name, :status_user_name
    rename_column :statuses, :user_id, :status_user_id

  end

  def self.down
    rename_column :statuses, :status_user_name, :user_name
    rename_column :statuses, :status_user_id, :user_id
  end
end
