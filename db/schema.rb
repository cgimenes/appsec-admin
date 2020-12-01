# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_173340) do

  create_table "assets", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "body"
    t.integer "vuln_id"
    t.boolean "edited", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["vuln_id"], name: "index_comments_on_vuln_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "fullname", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.text "object_changes", limit: 1073741823
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "vulns", force: :cascade do |t|
    t.text "title", null: false
    t.text "description", null: false
    t.string "risk", null: false
    t.date "reported_at", null: false
    t.string "status", null: false
    t.date "fixed_at"
    t.integer "reporter_id"
    t.integer "team_id"
    t.integer "affected_asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affected_asset_id"], name: "index_vulns_on_affected_asset_id"
    t.index ["reporter_id"], name: "index_vulns_on_reporter_id"
    t.index ["team_id"], name: "index_vulns_on_team_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "vulns"
  add_foreign_key "vulns", "assets", column: "affected_asset_id"
  add_foreign_key "vulns", "teams"
  add_foreign_key "vulns", "users", column: "reporter_id"
end
