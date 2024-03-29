# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120504044440) do

  create_table "bids", :force => true do |t|
    t.integer  "price"
    t.integer  "delivery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "accepted"
  end

  add_index "bids", ["delivery_id"], :name => "index_bids_on_delivery_id"

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "delivery_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["delivery_id"], :name => "index_comments_on_delivery_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "deliveries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "weight"
    t.decimal  "height"
    t.decimal  "length"
    t.decimal  "wideness"
    t.string   "from_city"
    t.string   "from_address"
    t.string   "to_city"
    t.string   "to_address"
    t.date     "date"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "expired",      :default => false
    t.boolean  "accepted"
    t.string   "category"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
