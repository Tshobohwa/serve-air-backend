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

ActiveRecord::Schema[7.1].define(version: 2024_10_05_115827) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "territory"
    t.string "province"
    t.index ["city"], name: "index_addresses_on_city", unique: true
  end

  create_table "destinations", force: :cascade do |t|
    t.integer "address_id"
    t.index ["address_id"], name: "index_destinations_on_address_id", unique: true
  end

  create_table "origins", force: :cascade do |t|
    t.integer "address_id"
    t.index ["address_id"], name: "index_origins_on_address_id", unique: true
  end

  create_table "packages", force: :cascade do |t|
    t.float "weight"
    t.text "description"
    t.integer "status_id"
    t.integer "route_id"
    t.integer "current_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
    t.string "sender_name"
    t.string "sender_phone_number"
    t.string "receiver_name"
    t.string "receiver_phone_number"
    t.decimal "price"
    t.integer "origin_id"
    t.integer "destination_id"
    t.index ["creator_id"], name: "index_packages_on_creator_id"
    t.index ["destination_id"], name: "index_packages_on_destination_id"
    t.index ["origin_id"], name: "index_packages_on_origin_id"
    t.index ["route_id"], name: "index_packages_on_route_id"
    t.index ["status_id"], name: "index_packages_on_status_id"
  end

  create_table "routes", force: :cascade do |t|
    t.decimal "pricing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "origin_id"
    t.integer "destination_id"
    t.index ["destination_id"], name: "index_routes_on_destination_id"
    t.index ["origin_id", "destination_id"], name: "index_routes_on_origin_id_and_destination_id", unique: true
    t.index ["origin_id"], name: "index_routes_on_origin_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["name"], name: "index_statuses_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "destinations", "addresses"
  add_foreign_key "origins", "addresses"
  add_foreign_key "packages", "addresses", column: "current_address_id"
  add_foreign_key "packages", "addresses", column: "destination_id"
  add_foreign_key "packages", "addresses", column: "origin_id"
  add_foreign_key "packages", "routes"
  add_foreign_key "packages", "statuses"
  add_foreign_key "packages", "users", column: "creator_id"
  add_foreign_key "routes", "destinations"
  add_foreign_key "routes", "origins"
  add_foreign_key "users", "addresses"
end
