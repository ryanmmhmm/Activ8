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

ActiveRecord::Schema.define(version: 20160111035803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.datetime "end_time"
    t.string   "picture_url"
    t.integer  "owner_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location_title"
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.boolean  "athletic",       default: false
    t.boolean  "sporting_event", default: false
    t.boolean  "night_life",     default: false
    t.boolean  "general",        default: false
    t.boolean  "other",          default: false
    t.boolean  "random",         default: false
    t.boolean  "food",           default: false
    t.boolean  "drink",          default: false
    t.boolean  "music",          default: false
    t.boolean  "game",           default: false
    t.boolean  "information",    default: false
    t.boolean  "art",            default: false
    t.boolean  "technology",     default: false
    t.boolean  "deal",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.string   "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "picture_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
