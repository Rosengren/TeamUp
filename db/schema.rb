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

ActiveRecord::Schema.define(version: 20160303195500) do

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "picture_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  add_index "games_users", ["game_id"], name: "index_games_users_on_game_id"
  add_index "games_users", ["user_id"], name: "index_games_users_on_user_id"

  create_table "proficiencies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "picture_url"
    t.integer  "game_id"
    t.integer  "users_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "proficiencies", ["game_id"], name: "index_proficiencies_on_game_id"
  add_index "proficiencies", ["users_id"], name: "index_proficiencies_on_users_id"

  create_table "proficiency_posts", force: :cascade do |t|
    t.string   "title"
    t.string   "username"
    t.datetime "date"
    t.text     "content"
    t.integer  "proficiency_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "proficiency_posts", ["proficiency_id"], name: "index_proficiency_posts_on_proficiency_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "community_rating"
    t.string   "location"
    t.text     "picture_url"
    t.integer  "game_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "teams", ["game_id"], name: "index_teams_on_game_id"

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
    t.text     "description"
    t.text     "picture_url"
    t.integer  "permission_level"
    t.string   "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
