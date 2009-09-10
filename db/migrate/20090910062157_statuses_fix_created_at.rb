class StatusesFixCreatedAt < ActiveRecord::Migration
  def self.up
	change_column :statuses, :created_at, :datetime
	add_column :statuses, :status_at, :datetime
  end

  def self.down
	remove_column :statuses, :status_at
  end
end
