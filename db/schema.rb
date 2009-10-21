# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091021030021) do

  create_table "statuses", :force => true do |t|
    t.string   "network"
    t.string   "user_name"
    t.string   "status_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "status_json"
    t.datetime "status_created_at"
    t.integer  "status_id"
    t.integer  "user_id"
    t.text     "user_json"
    t.string   "reply_status_id"
    t.text     "user_image_url"
    t.integer  "user_followers_count"
  end

  add_index "statuses", ["status_created_at"], :name => "index_statuses_on_status_at"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "token",              :limit => 128
    t.datetime "token_expires_at"
    t.boolean  "email_confirmed",                   :default => false, :null => false
    t.boolean  "tw_auth"
    t.boolean  "fb_auth"
    t.string   "atoken"
    t.string   "asecret"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "token"], :name => "index_users_on_id_and_token"
  add_index "users", ["token"], :name => "index_users_on_token"

end
