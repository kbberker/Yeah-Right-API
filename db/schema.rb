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

ActiveRecord::Schema.define(version: 2019_02_06_124219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.bigint "round_id"
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_answers_on_player_id"
    t.index ["round_id"], name: "index_answers_on_round_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.boolean "is_dasher"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.string "name"
    t.integer "round_num"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_votes_on_answer_id"
    t.index ["player_id"], name: "index_votes_on_player_id"
  end

  add_foreign_key "answers", "players"
  add_foreign_key "answers", "rounds"
  add_foreign_key "players", "games"
  add_foreign_key "rounds", "games"
  add_foreign_key "votes", "answers"
  add_foreign_key "votes", "players"
end
