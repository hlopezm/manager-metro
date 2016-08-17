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

ActiveRecord::Schema.define(version: 20150620051453) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "executors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "project_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["project_id"], name: "index_order_items_on_project_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "state",      default: "new"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "image"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "category_id",           default: 1
    t.integer  "portfolio_id",          default: 1
    t.integer  "executor_id",           default: 1
    t.integer  "unit_id",               default: 1
    t.string   "location"
    t.string   "auth_number"
    t.string   "contract_number"
    t.float    "requested_amount"
    t.float    "authorized_amount"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "contact"
    t.string   "target_set"
    t.float    "physical_progress"
    t.float    "financial_progress"
    t.string   "extension"
    t.string   "contract_modification"
    t.datetime "delivery_date"
    t.string   "status"
    t.string   "observations"
    t.float    "economy"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["executor_id"], name: "index_projects_on_executor_id"
    t.index ["portfolio_id"], name: "index_projects_on_portfolio_id"
    t.index ["unit_id"], name: "index_projects_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.datetime "date_of_birth"
    t.boolean  "is_female",              default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
