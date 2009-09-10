class StatusesFixJson < ActiveRecord::Migration
  def self.up
	rename_column :statuses, :json, :status_json
  end

  def self.down
	rename_column :statuses, :status_json, :json
  end
end
