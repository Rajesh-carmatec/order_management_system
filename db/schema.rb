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

ActiveRecord::Schema.define(version: 20171001193348) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "addrress_line_1"
    t.string   "addrress_line_2"
    t.string   "pincode"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "is_current_address"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "food_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price",       limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "order_id"
    t.index ["order_id"], name: "index_food_items_on_order_id", using: :btree
  end

  create_table "food_items_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.integer  "food_item_id"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["food_item_id"], name: "index_food_items_orders_on_food_item_id", using: :btree
    t.index ["order_id"], name: "index_food_items_orders_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tittle"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "time_slot"
    t.boolean  "status"
  end

  create_table "payment_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "amount",       limit: 24
    t.string   "payment_type"
    t.integer  "order_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["order_id"], name: "index_payment_methods_on_order_id", using: :btree
  end

  create_table "payment_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "food_items", "orders"
  add_foreign_key "food_items_orders", "food_items"
  add_foreign_key "food_items_orders", "orders"
  add_foreign_key "payment_methods", "orders"
end
