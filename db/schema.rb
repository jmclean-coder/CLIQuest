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

ActiveRecord::Schema.define(version: 20200326170751) do

  create_table "hero_quests", force: :cascade do |t|
    t.integer  "hero_id"
    t.integer  "quest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "level"
    t.integer  "exp"
    t.integer  "exp_til_level"
    t.integer  "hit_points"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "intellect"
    t.integer  "luck"
    t.boolean  "alive"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "gold"
    t.integer  "user_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "hit_points"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "intellect"
    t.boolean  "alive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quest_monsters", force: :cascade do |t|
    t.integer  "quest_id"
    t.integer  "monster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quests", force: :cascade do |t|
    t.string   "quest_name"
    t.text     "location"
    t.text     "description"
    t.integer  "reward_gold"
    t.integer  "reward_exp"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
