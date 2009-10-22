class StatusRenameFavorited < ActiveRecord::Migration
  def self.up
    rename_column :statuses, :favorited, :status_favorited
  end

  def self.down
    rename_column :statuses, :status_favorited, :favorited
  end

end
