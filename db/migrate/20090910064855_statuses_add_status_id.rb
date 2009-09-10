class StatusesAddStatusId < ActiveRecord::Migration
  def self.up
	add_column :statuses, :status_id, :integer
  end

  def self.down
	remove_column :statuses, :status_id
  end
end
