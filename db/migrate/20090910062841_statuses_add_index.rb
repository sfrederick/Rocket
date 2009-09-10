class StatusesAddIndex < ActiveRecord::Migration
  def self.up
	add_index :statuses, :status_at
  end

  def self.down
	remove_index :statuses, :status_at
  end
end
