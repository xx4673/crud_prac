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

ActiveRecord::Schema.define(version: 2021_02_10_121518) do

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "party"
    t.integer "votes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vote_logs_count"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "profession"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doctors_patients", force: :cascade do |t|
    t.integer "doctor_id"
    t.integer "patient_id"
    t.index ["doctor_id"], name: "index_doctors_patients_on_doctor_id"
    t.index ["patient_id"], name: "index_doctors_patients_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vote_logs", force: :cascade do |t|
    t.integer "candidate_id", null: false
    t.string "ip_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_vote_logs_on_candidate_id"
  end

  create_table "ware_houses", force: :cascade do |t|
    t.integer "store_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_ware_houses_on_product_id"
    t.index ["store_id"], name: "index_ware_houses_on_store_id"
  end

  add_foreign_key "doctors_patients", "doctors"
  add_foreign_key "doctors_patients", "patients"
  add_foreign_key "vote_logs", "candidates"
  add_foreign_key "ware_houses", "products"
  add_foreign_key "ware_houses", "stores"
end
