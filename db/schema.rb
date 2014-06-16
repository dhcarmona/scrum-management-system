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

ActiveRecord::Schema.define(version: 20140614192053) do

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_owner_id"
    t.integer  "scrum_master_id"
    t.integer  "sprint_duration_in_weeks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_users", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "risks", force: true do |t|
    t.string   "identifier"
    t.string   "short_description"
    t.text     "detailed_description"
    t.float    "chance"
    t.integer  "responsible_id"
    t.text     "action_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "sprints", force: true do |t|
    t.integer  "release_id"
    t.text     "sprint_review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stakeholders", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "expectations"
    t.text     "interest"
    t.text     "power"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "success_criterions", force: true do |t|
    t.text     "description"
    t.boolean  "completed"
    t.integer  "user_story_task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_stories", force: true do |t|
    t.text     "description"
    t.integer  "priority"
    t.integer  "sprint_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
    t.integer  "project_id"
  end

  create_table "user_story_tasks", force: true do |t|
    t.text     "description"
    t.integer  "user_story_id"
    t.integer  "stimated_effort_in_hours"
    t.integer  "actual_effort_in_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isadmin"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
