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

ActiveRecord::Schema.define(version: 2018_08_02_234734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "dba"
    t.string "street1"
    t.string "street2"
    t.string "city", null: false
    t.string "state"
    t.integer "country_id"
    t.string "postal_code", null: false
    t.integer "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "account_id"
    t.integer "company_id"
    t.string "company_name"
    t.string "contact"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.integer "country_id"
    t.string "postal_code"
    t.string "email"
    t.string "phone"
    t.string "fax"
    t.text "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer "account_id"
    t.string "type"
    t.string "name"
    t.string "tax_id"
    t.text "comment"
    t.integer "warehouse_id"
    t.integer "payment_term_id"
    t.integer "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "account_id"
    t.integer "company_id"
    t.string "first_name"
    t.string "last_name"
    t.string "job_title"
    t.string "email"
    t.string "phone"
    t.string "mobile"
    t.string "fax"
    t.string "comment"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "alpha2", null: false
    t.string "alpha3", null: false
    t.string "numeric", null: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "alpha", null: false
    t.string "numeric", null: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer "user_id"
    t.integer "account_id"
    t.boolean "subscriber", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_options", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_terms", force: :cascade do |t|
    t.integer "account_id"
    t.integer "payment_option_id"
    t.string "name", null: false
    t.integer "days", default: 0
    t.decimal "trade_credit_rate"
    t.integer "trade_credit_days"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.string "first_name"
    t.string "last_name"
    t.integer "current_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.string "contact"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.integer "country_id"
    t.string "postal_code"
    t.string "email"
    t.string "phone"
    t.string "fax"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
