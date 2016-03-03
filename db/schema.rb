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

ActiveRecord::Schema.define(version: 20160303172406) do

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "picture_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "picture_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "proficiency_posts", force: :cascade do |t|
    t.string   "title"
    t.string   "username"
    t.datetime "date"
    t.text     "content"
    t.integer  "profiency_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "proficiency_posts", ["profiency_id"], name: "index_proficiency_posts_on_profiency_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "game"
    t.text     "description"
    t.integer  "community_rating"
    t.string   "location"
    t.text     "picture_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "user_proficiencies", force: :cascade do |t|
    t.text     "endorsements"
    t.integer  "user_id"
    t.integer  "proficiency_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_proficiencies", ["proficiency_id"], name: "index_user_proficiencies_on_proficiency_id"
  add_index "user_proficiencies", ["user_id"], name: "index_user_proficiencies_on_user_id"

  create_table "user_teams", force: :cascade do |t|
    t.string   "role"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_teams", ["team_id"], name: "index_user_teams_on_team_id"
  add_index "user_teams", ["user_id"], name: "index_user_teams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.text     "description"
    t.text     "picture_url"
    t.integer  "permission_level"
    t.integer  "team_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id"

end
