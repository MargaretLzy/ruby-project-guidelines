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

ActiveRecord::Schema.define(version: 2021_06_21_193724) do

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "city"
    t.string "type"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.integer "age"
    t.string "state"
    t.string "city"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "hospital_id"
    t.integer "rating"
    t.string "comment"
  end

end
