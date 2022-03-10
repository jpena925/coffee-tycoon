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

ActiveRecord::Schema.define(version: 2022_03_07_221959) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.float "want_hot"
    t.string "happy_saying"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "drink_type"
    t.boolean "hot"
    t.float "buy_price"
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "store_id"
    t.integer "quantity"
    t.index ["item_id"], name: "index_menu_items_on_item_id"
    t.index ["store_id"], name: "index_menu_items_on_store_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "sell_price"
    t.integer "menu_item_id"
    t.integer "customer_id"
    t.boolean "fulfilled"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["menu_item_id"], name: "index_orders_on_menu_item_id"
  end

  create_table "stores", force: :cascade do |t|
    t.float "money"
    t.float "popularity"
  end

end
