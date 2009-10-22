class StatusChangeFavoritedType < ActiveRecord::Migration
  def self.up
    change_column :statuses, :status_favorited, :boolean
  end

  def self.down
    change_column :statuses, :status_favorited, :binary
  end
end
