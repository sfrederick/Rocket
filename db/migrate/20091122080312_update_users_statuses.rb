class UpdateUsersStatuses < ActiveRecord::Migration
  def self.up
    remove_column :users_statuses, :id
    add_index :users_statuses, [:user_id, :status_id, :network], :unique => true
    add_index :users_statuses, :user_id, :unique => false
  end

  def self.down
    add_column :users_statuses, :id, :integer, :null => false,
      :options => "PRIMARY KEY AUTOINCREMENT"
    remove_index :users_statuses, [:user_id, :status_id, :network]
    remote_index :users_statuses, :user_id
  end
end
