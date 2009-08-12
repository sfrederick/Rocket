class AddAuthToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :tw_auth, :boolean
    add_column :users, :fb_auth, :boolean
    remove_column :users, :fb_userid
    remove_column :users, :tw_userid
  end

  def self.down
    remove_column :users, :fb_auth
    remove_column :users, :tw_auth
    add_column :users, :fb_userid
    add_column :users, :tw_userid
  end
end
