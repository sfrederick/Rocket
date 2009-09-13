class AddStatusUserJson < ActiveRecord::Migration
  def self.up
	add_column :statuses, :user_json, :text
  end

  def self.down
	remove_column :statuses, :user_json
  end
end
