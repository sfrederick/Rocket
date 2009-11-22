class CreateUsersStatuses < ActiveRecord::Migration
  def self.up
    execute %{
      CREATE TABLE "users_statuses" (
        "user_id" integer
          CONSTRAINT fk_users_statuses_users REFERENCES users(id),
        "status_id" integer
          CONSTRAINT fk_users_statuses_statuses REFERENCES statuses(status_id),
        "network" varchar(255),
        "created_at" datetime,
        "updated_at" datetime)
    }
    end
  end

  def self.down
    drop_table :users_statuses
  end
end
