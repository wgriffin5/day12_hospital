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

ActiveRecord::Schema.define(version: 20150511145027) do

  create_table "doctors", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "practice",        limit: 255
    t.string   "doctorable_type", limit: 255
    t.integer  "doctorable_id",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "photo",           limit: 255
  end

  create_table "hospital_doctors", force: :cascade do |t|
    t.integer  "hospital_id", limit: 4
    t.integer  "doctor_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.string   "specialty",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "photo",      limit: 255
  end

  create_table "medications", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "patient_id",  limit: 255
    t.string   "hospital_id", limit: 255
    t.float    "cost",        limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "patient_doctors", force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.integer  "doctor_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "patient_medications", force: :cascade do |t|
    t.integer  "patient_id",    limit: 4
    t.integer  "medication_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "patients", force: :cascade do |t|
    t.text     "first_name",     limit: 65535
    t.text     "last_name",      limit: 65535
    t.date     "date_of_birth"
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "blood_type",     limit: 255
    t.string   "gender",         limit: 255
    t.integer  "hospital_id",    limit: 4
    t.string   "workflow_state", limit: 255
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "score",        limit: 4
    t.text     "comment",      limit: 65535
    t.integer  "ratable_id",   limit: 4
    t.string   "ratable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
