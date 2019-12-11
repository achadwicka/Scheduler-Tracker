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

ActiveRecord::Schema.define(version: 20190627205921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut"
    t.datetime "birth_date"
    t.string "cel_number"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "blocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
    t.text "description"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut"
    t.date "birth_date"
    t.string "cel_number"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "diagnoses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.text "description"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rut"
    t.datetime "birth_date"
    t.string "cel_number"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id"
    t.bigint "block_id"
    t.bigint "doctor_id"
    t.date "date"
    t.index ["block_id"], name: "index_reservations_on_block_id"
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["doctor_id"], name: "index_reservations_on_doctor_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.text "comment"
    t.integer "client_id"
    t.integer "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "blocks"
  add_foreign_key "reservations", "clients"
  add_foreign_key "reservations", "doctors"
end
