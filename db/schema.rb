# encoding: UTF-8
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

<<<<<<< 813d6f55604a39a42179a0b95601d966aad1a1e7
ActiveRecord::Schema.define(version: 20160721230116) do
=======
ActiveRecord::Schema.define(version: 20160721124727) do
>>>>>>> messaging bones started

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.date     "date_of_birth"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree
  add_index "customers", ["username"], name: "index_customers_on_username", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "customer_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "biography"
    t.integer  "customer_id"
    t.string   "gender"
    t.string   "name"
    t.string   "postcode"
    t.decimal  "latitude"
    t.decimal  "longitude"
<<<<<<< 813d6f55604a39a42179a0b95601d966aad1a1e7
    t.integer  "weight"
    t.text     "desires"
    t.string   "weight_unit"
    t.boolean  "smoker"
    t.boolean  "drinks"
    t.string   "occupation"
    t.string   "industry"
    t.string   "images",            default: [],              array: true
    t.string   "ethnicity"
    t.integer  "height"
    t.string   "education"
    t.integer  "religious_beliefs"
=======
    t.boolean  "drinks"
>>>>>>> messaging bones started
  end

end
