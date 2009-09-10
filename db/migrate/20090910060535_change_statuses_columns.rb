class ChangeStatusesColumns < ActiveRecord::Migration
  def self.up
	rename_column :statuses, :source, :network
	rename_column :statuses, :user_id, :user_name
	rename_column :statuses, :update, :created_at
	remove_column :statuses, :means
  end

  def self.down
 	rename_column :statuses, :network, :source
        rename_column :statuses, :user_name, :user_id 
        rename_column :statuses, :created_at, :update 
        add_column :statuses, :means, :string
  end
end
