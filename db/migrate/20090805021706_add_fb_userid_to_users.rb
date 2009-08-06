class AddFbUseridToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fb_userid, :string
  end

  def self.down
    remove_column :users, :fb_userid
  end
end
