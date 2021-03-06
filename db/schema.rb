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

ActiveRecord::Schema.define(version: 2018_07_21_152707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_item_menus", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "dish_item_id"
    t.index ["dish_item_id"], name: "index_dish_item_menus_on_dish_item_id"
    t.index ["menu_id"], name: "index_dish_item_menus_on_menu_id"
  end

  create_table "dish_item_orders", force: :cascade do |t|
    t.bigint "dish_item_id"
    t.bigint "order_id"
    t.index ["dish_item_id"], name: "index_dish_item_orders_on_dish_item_id"
    t.index ["order_id"], name: "index_dish_item_orders_on_order_id"
  end

  create_table "dish_items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "price"
    t.string "first"
    t.string "main"
    t.string "drink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "public_key"
    t.string "secret_key"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
