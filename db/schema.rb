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

ActiveRecord::Schema.define(version: 2019_04_20_040518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_favorites_on_food_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "barcode"
    t.string "product_name"
    t.string "brand"
    t.string "nutrition_grade"
    t.integer "salt_quantity"
    t.string "salt_nutrient_level"
    t.integer "calories_quantity"
    t.string "calories_nutrient_level"
    t.integer "protein_quantity"
    t.string "protein_nutrient_level"
    t.integer "saturated_fat_quantity"
    t.string "saturated_fat_nutrient_level"
    t.integer "fiber_quantity"
    t.string "fiber_nutrient_level"
    t.integer "sugar_quantity"
    t.string "sugar_nutrient_level"
    t.string "ingredients"
    t.string "allergens"
    t.string "packaging_type"
    t.string "labels"
    t.string "image_url"
    t.string "additives"
    t.string "category"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "calories_percentage"
    t.integer "salt_percentage"
    t.integer "sugar_percentage"
    t.integer "saturated_fat_percentage"
    t.integer "protein_percentage"
    t.integer "fiber_percentage"
  end

  create_table "scans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_scans_on_food_id"
    t.index ["user_id"], name: "index_scans_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "openid"
    t.string "session_key"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "iv"
    t.string "encryptedData"
    t.string "openid"
    t.string "session_key"
  end

  add_foreign_key "favorites", "foods"
  add_foreign_key "favorites", "users"
  add_foreign_key "scans", "foods"
  add_foreign_key "scans", "users"
end
