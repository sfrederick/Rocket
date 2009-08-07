class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.string :source
      t.integer :user_id
      t.text :status
      t.date :update
      t.string :means

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
