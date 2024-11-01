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

ActiveRecord::Schema[7.2].define(version: 2024_11_01_051433) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 80, null: false
    t.string "last_name", limit: 80, default: ""
    t.string "email", limit: 50, null: false
    t.string "gender", limit: 10, null: false
    t.string "country_code", limit: 8, null: false
    t.bigint "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_code", "phone_number"], name: "index_users_on_country_code_and_phone_number", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
