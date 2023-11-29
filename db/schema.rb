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

ActiveRecord::Schema[7.1].define(version: 2023_11_29_122737) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.bigint "currency_id", null: false
    t.decimal "rate", precision: 10, scale: 5, null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id", "date"], name: "index_exchange_rates_on_currency_id_and_date", unique: true
    t.index ["currency_id"], name: "index_exchange_rates_on_currency_id"
  end

  add_foreign_key "exchange_rates", "currencies"
end
