class StatusesAddBlob < ActiveRecord::Migration
  def self.up
	add_column :statuses, :json, :text
  end

  def self.down
	remove_column :statuses, :json
  end
end
