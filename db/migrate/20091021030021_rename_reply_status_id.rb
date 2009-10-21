class RenameReplyStatusId < ActiveRecord::Migration
  def self.up
    rename_column :statuses, :status_reply_id, :reply_status_id
    add_column :statuses, :user_followers_count, :integer
  end

  def self.down
    rename_column :statuses, :reply_status_id, :status_reply_id
    remove_column :statuses, :user_followers_count
  end
end
