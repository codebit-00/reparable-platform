# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_21_202456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_devices_on_name", unique: true
  end

  create_table "reparation_requests", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.integer "device"
    t.string "status", default: "pending"
    t.date "purchase_installation_date"
    t.text "issue_description"
    t.string "model_number"
    t.string "requester_zip_code"
    t.string "requester_address"
    t.string "requester_first_name"
    t.string "requester_last_name"
    t.string "requester_email"
    t.string "requester_telephone"
    t.string "requester_country"
    t.string "requester_state"
    t.string "requester_city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "price"
    t.index ["store_id"], name: "index_reparation_requests_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "priority"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "store_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "reparation_requests", "stores"
end
