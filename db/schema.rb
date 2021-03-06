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

ActiveRecord::Schema.define(version: 20160705214515) do

  create_table "advisors", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "special"
    t.text     "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "img_url"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "img_url"
    t.string   "industry"
    t.text     "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.string   "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "sub_title"
    t.integer  "leader_id"
    t.integer  "advisor_id"
    t.text     "desc"
    t.integer  "num_people"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "type_id"
    t.string   "skills"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["project_id"], name: "index_teams_on_project_id"
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "major_id"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
