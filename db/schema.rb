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

ActiveRecord::Schema.define(version: 20150715181034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arguments", force: :cascade do |t|
    t.string   "body",                              null: false
    t.integer  "score",                 default: 0
    t.integer  "debate_id",                         null: false
    t.integer  "debate_participant_id",             null: false
    t.integer  "side_id",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debate_participants", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "side_id",                null: false
    t.integer  "debate_id",              null: false
    t.integer  "score",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debate_sides", force: :cascade do |t|
    t.integer "debate_id"
    t.integer "side_id"
  end

  create_table "debates", force: :cascade do |t|
    t.integer  "topic_id",   null: false
    t.string   "turn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sides", force: :cascade do |t|
    t.string   "title",                  null: false
    t.integer  "points",     default: 0
    t.integer  "topic_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: :cascade do |t|
    t.string   "abbreviation", null: false
    t.string   "state",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "category",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "state_id"
    t.integer  "city_id"
    t.string   "role",                   default: "user"
    t.integer  "xp",                     default: 0
    t.string   "rank",                   default: "Noob"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
