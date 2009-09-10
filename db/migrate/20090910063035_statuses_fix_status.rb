class StatusesFixStatus < ActiveRecord::Migration
  def self.up
	rename_column :statuses, :status, :status_text
	change_column :statuses, :status_text, :string
  end

  def self.down
  end
end
