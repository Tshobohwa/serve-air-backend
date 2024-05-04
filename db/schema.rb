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

ActiveRecord::Schema[7.1].define(version: 2024_05_04_101348) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
  end

  create_table "packages", force: :cascade do |t|
    t.float "weight"
    t.text "description"
    t.integer "status_id"
    t.integer "route_id"
    t.integer "current_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_packages_on_route_id"
    t.index ["status_id"], name: "index_packages_on_status_id"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "origin_id"
    t.integer "destination_id"
    t.integer "pricing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["origin_id", "destination_id"], name: "index_routes_on_origin_id_and_destination_id", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "address_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["address_id"], name: "index_users_on_address_id"
  end

  add_foreign_key "packages", "addresses", column: "current_address_id"
  add_foreign_key "packages", "routes"
  add_foreign_key "packages", "statuses"
  add_foreign_key "routes", "addresses", column: "destination_id"
  add_foreign_key "routes", "addresses", column: "origin_id"
  add_foreign_key "users", "addresses"
end
