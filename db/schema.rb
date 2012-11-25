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

ActiveRecord::Schema.define(:version => 20121125230244) do

  create_table "flags", :force => true do |t|
    t.integer  "user_id"
    t.integer  "insult_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flags", ["insult_id"], :name => "index_flags_on_insult_id"
  add_index "flags", ["user_id"], :name => "index_flags_on_user_id"

  create_table "insults", :force => true do |t|
    t.string   "insult"
    t.integer  "points",     :default => 0
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "insults", ["user_id"], :name => "index_insults_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "points",          :default => 0
  end

  create_table "votes", :force => true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "insult_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["insult_id"], :name => "index_votes_on_insult_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
