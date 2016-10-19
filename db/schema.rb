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

ActiveRecord::Schema.define(version: 20161019154015) do

  create_table "chefs", force: :cascade do |t|
    t.string   "chefname",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "likes", force: :cascade do |t|
    t.boolean  "like"
    t.integer  "chef_id",    limit: 4
    t.integer  "recipe_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "likes", ["chef_id"], name: "index_likes_on_chef_id", using: :btree
  add_index "likes", ["recipe_id"], name: "index_likes_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "summary",     limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "chef_id",     limit: 4
    t.string   "picture",     limit: 255
    t.integer  "likes_count", limit: 4,     default: 0, null: false
  end

  add_index "recipes", ["chef_id"], name: "index_recipes_on_chef_id", using: :btree

  add_foreign_key "likes", "chefs"
  add_foreign_key "likes", "recipes"
  add_foreign_key "recipes", "chefs"
end
