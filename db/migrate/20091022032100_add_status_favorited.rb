class AddStatusFavorited < ActiveRecord::Migration
  def self.up
    add_column :statuses, :favorited, :binary
  end

  def self.down
    remove_column :statuses, :favorited
  end
end
