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

ActiveRecord::Schema.define(version: 2021_01_25_210631) do

  create_table "appointments", force: :cascade do |t|
    t.integer "coach_id"
    t.string "email", null: false
    t.datetime "start_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id", "start_time"], name: "index_appointments_on_coach_id_and_start_time"
    t.index ["coach_id"], name: "index_appointments_on_coach_id"
  end

  create_table "available_weekdays", force: :cascade do |t|
    t.integer "coach_id"
    t.integer "weekday", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_available_weekdays_on_coach_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name", null: false
    t.string "time_zone_string", null: false
    t.string "time_zone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_coaches_on_name"
  end

  add_foreign_key "appointments", "coaches"
  add_foreign_key "available_weekdays", "coaches"
end
