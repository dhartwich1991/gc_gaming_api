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

ActiveRecord::Schema.define(version: 20150107083340) do

  create_table "characters", force: true do |t|
    t.integer  "lastModified"
    t.string   "name"
    t.string   "realm"
    t.string   "battlegroup"
    t.integer  "class"
    t.integer  "race"
    t.integer  "gender"
    t.integer  "level"
    t.integer  "achievementPoints"
    t.string   "thumbnailurl"
    t.integer  "itemleveltotal"
    t.integer  "itemlevelequipped"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "userid"
  end

  create_table "raids", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "raidlead"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "startdate"
    t.datetime "enddate"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.boolean  "admin"
    t.boolean  "moderator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "access_token"
  end

  create_table "users_raids", force: true do |t|
    t.integer  "user_id"
    t.integer  "raid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_raids", ["raid_id"], name: "index_users_raids_on_raid_id"
  add_index "users_raids", ["user_id", "raid_id"], name: "index_users_raids_on_user_id_and_raid_id", unique: true
  add_index "users_raids", ["user_id"], name: "index_users_raids_on_user_id"

end
