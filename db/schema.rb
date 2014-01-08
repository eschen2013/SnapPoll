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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140108013253) do

  create_table "answers", force: true do |t|
    t.integer  "poll_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["poll_id"], name: "index_answers_on_poll_id"

  create_table "poll_users", force: true do |t|
    t.integer  "poll_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "poll_users", ["poll_id"], name: "index_poll_users_on_poll_id"
  add_index "poll_users", ["user_id"], name: "index_poll_users_on_user_id"

  create_table "polls", force: true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "allow_write_in"
    t.datetime "expires_at"
  end

  add_index "polls", ["user_id"], name: "index_polls_on_user_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "votes", force: true do |t|
    t.integer  "poll_user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["answer_id"], name: "index_votes_on_answer_id"
  add_index "votes", ["poll_user_id"], name: "index_votes_on_poll_user_id"

end
