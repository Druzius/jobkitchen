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

ActiveRecord::Schema.define(version: 2019_05_29_120310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hebrew"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "phone_number"
    t.string "email"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_id"
    t.string "full_name"
    t.string "resume"
    t.text "work_experience"
    t.text "summary"
    t.string "years_experience"
    t.index ["job_id"], name: "index_job_applications_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.text "description"
    t.string "location"
    t.string "job_author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.integer "user_id"
    t.bigint "job_applications_id"
    t.integer "state", default: 0, null: false
    t.bigint "position_id"
    t.string "phone"
    t.string "job_phone"
    t.string "address"
    t.index ["job_applications_id"], name: "index_jobs_on_job_applications_id"
    t.index ["position_id"], name: "index_jobs_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_positions_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "email_checkbox"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "job_applications", "jobs"
  add_foreign_key "jobs", "job_applications", column: "job_applications_id"
  add_foreign_key "jobs", "positions"
  add_foreign_key "positions", "categories"
end
