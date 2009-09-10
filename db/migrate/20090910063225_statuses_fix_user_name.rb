class StatusesFixUserName < ActiveRecord::Migration
  def self.up
	change_column :statuses, :user_name, :string
  end

  def self.down
  end
end
