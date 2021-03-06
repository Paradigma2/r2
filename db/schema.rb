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

ActiveRecord::Schema.define(version: 2021_08_28_132820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_ads", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "employer", null: false
    t.string "email", null: false
    t.integer "category", null: false
    t.date "valid_until"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_job_ads_on_user_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "job_ad_id", null: false
    t.string "email", null: false
    t.string "full_name", null: false
    t.date "date_of_birth"
    t.string "address", null: false
    t.string "phone_number", null: false
    t.integer "qualification", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_ad_id"], name: "index_job_applications_on_job_ad_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "job_ads", "users"
  add_foreign_key "job_applications", "job_ads"
end
