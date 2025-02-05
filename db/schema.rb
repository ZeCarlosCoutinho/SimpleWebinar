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

ActiveRecord::Schema[8.0].define(version: 2025_02_05_152906) do
  create_table "broadcasts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.datetime "broadcast_date"
    t.integer "subscriptions_count", default: 0
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "watched", default: false
    t.string "email", limit: 191
    t.string "firstname"
    t.string "surname"
    t.string "registration_ip"
    t.integer "broadcast_id"
    t.string "personal_token"
    t.index ["broadcast_id"], name: "broadcast_id"
    t.index ["email"], name: "index_subscriptions_on_email", unique: true
    t.index ["personal_token"], name: "index_subscriptions_on_personal_token", unique: true
  end

  add_foreign_key "subscriptions", "broadcasts"
end
