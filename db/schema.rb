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

ActiveRecord::Schema.define(version: 20151214175340) do

  create_table "friends", force: :cascade do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friends", ["from_id", "to_id"], name: "index_friends_on_from_id_and_to_id", unique: true
  add_index "friends", ["from_id"], name: "index_friends_on_from_id"
  add_index "friends", ["to_id"], name: "index_friends_on_to_id"

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.boolean  "read",         default: false
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
