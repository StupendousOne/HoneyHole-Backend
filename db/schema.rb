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

ActiveRecord::Schema.define(version: 2020_05_23_193650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fishing_spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fishing_spot_id"], name: "index_favorites_on_fishing_spot_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "fish", force: :cascade do |t|
    t.string "species"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fish_spots", force: :cascade do |t|
    t.bigint "fish_id", null: false
    t.bigint "fishing_spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fish_id"], name: "index_fish_spots_on_fish_id"
    t.index ["fishing_spot_id"], name: "index_fish_spots_on_fishing_spot_id"
  end

  create_table "fishing_spots", force: :cascade do |t|
    t.string "name"
    t.string "longitude"
    t.string "image"
    t.string "public_access"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    
    t.string "site_info"
    t.index ["user_id"], name: "index_fishing_spots_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "rating"
    t.bigint "fishing_spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fishing_spot_id"], name: "index_reviews_on_fishing_spot_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.string "username"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "favorites", "fishing_spots"
  add_foreign_key "favorites", "users"
  add_foreign_key "fish_spots", "fish"
  add_foreign_key "fish_spots", "fishing_spots"
  add_foreign_key "fishing_spots", "users"
  add_foreign_key "reviews", "fishing_spots"
  add_foreign_key "reviews", "users"
end
