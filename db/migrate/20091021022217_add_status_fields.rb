class AddStatusFields < ActiveRecord::Migration
  def self.up
    add_column :statuses, :status_reply_id, :string
    add_column :statuses, :user_image_url, :text
    rename_column :statuses, :status_at, :status_created_at
  end

  def self.down
    remove_column :statuses, :status_reply_id
    remove_column :statuses, :user_image_url
    rename_column :statuses, :status_created_at, :status_at
  end
end
