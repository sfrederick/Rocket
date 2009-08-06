class AddTwUseridToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tw_userid, :string
  end

  def self.down
    remove_column :users, :tw_userid
  end
end
