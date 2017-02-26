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

ActiveRecord::Schema.define(version: 20170226163731) do

  create_table "indivisual_checks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "work_id"
    t.index ["work_id"], name: "index_indivisual_checks_on_work_id", unique: true
  end

  create_table "lines", force: :cascade do |t|
    t.integer  "line_id"
    t.integer  "conv_state"
    t.string   "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_lines_on_line_id", unique: true
  end

  create_table "overall_checks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "work_id"
    t.index ["work_id"], name: "index_overall_checks_on_work_id", unique: true
  end

  create_table "shifts", force: :cascade do |t|
    t.string   "ymd"
    t.string   "time"
    t.integer  "status"
    t.integer  "default?",      default: 0
    t.integer  "work_or_rest?"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "worker_id"
    t.index ["worker_id", "ymd", "time"], name: "index_shifts_on_worker_id_and_ymd_and_time", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "age"
    t.string   "address"
    t.string   "picture"
    t.boolean  "fake?",                           default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "line_id"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["line_id"], name: "index_users_on_line_id", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "workers", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "admin",        default: false
    t.string   "first_day"
    t.string   "skill_values"
    t.integer  "user_id"
    t.integer  "work_id"
    t.index ["user_id", "work_id"], name: "index_workers_on_user_id_and_work_id", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "skill_items"
    t.string   "training_names"
    t.string   "qual_names"
    t.index ["name"], name: "index_works_on_name", unique: true
    t.index ["phone"], name: "index_works_on_phone", unique: true
  end

end
