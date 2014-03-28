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

ActiveRecord::Schema.define(version: 20140327020140) do

  create_table "adoptions", force: true do |t|
    t.date     "apply_date"
    t.integer  "people_id"
    t.integer  "animal_id"
    t.date     "adoption_date"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adoptions", ["animal_id"], name: "index_adoptions_on_animal_id", using: :btree
  add_index "adoptions", ["people_id"], name: "index_adoptions_on_people_id", using: :btree

  create_table "animal_files", force: true do |t|
    t.integer  "animal_id"
    t.string   "file_type",  limit: 5
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "animal_files", ["animal_id"], name: "index_animal_files_on_animal_id", using: :btree

  create_table "animals", force: true do |t|
    t.string   "animal_id",  limit: 10
    t.string   "name",       limit: 50
    t.string   "species",    limit: 10
    t.string   "breed",      limit: 50
    t.date     "birthday"
    t.date     "deathday"
    t.string   "gender",     limit: 6
    t.string   "size",       limit: 10
    t.string   "color",      limit: 10
    t.boolean  "sn"
    t.decimal  "price",                 precision: 7, scale: 2
    t.boolean  "stage"
    t.integer  "shelter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "animals", ["shelter_id"], name: "index_animals_on_shelter_id", using: :btree

  create_table "donations", force: true do |t|
    t.date     "apply_date"
    t.integer  "people_id"
    t.string   "donation_type", limit: 7
    t.text     "content"
    t.integer  "animal_id"
    t.date     "donation_date"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donations", ["animal_id"], name: "index_donations_on_animal_id", using: :btree
  add_index "donations", ["people_id"], name: "index_donations_on_people_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "user_id",        limit: 20
    t.string   "user_type",      limit: 11
    t.string   "name",           limit: 50
    t.string   "gender",         limit: 6
    t.integer  "age"
    t.string   "phone",          limit: 15
    t.string   "e_mail"
    t.string   "address",        limit: 100
    t.string   "city",           limit: 20
    t.string   "province",       limit: 15
    t.string   "postal_code",    limit: 6
    t.string   "education",      limit: 20
    t.string   "occupation",     limit: 20
    t.decimal  "income",                     precision: 12, scale: 2
    t.text     "special_skills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receipts", force: true do |t|
    t.integer  "people_id"
    t.integer  "animal_id"
    t.date     "received_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receipts", ["animal_id"], name: "index_receipts_on_animal_id", using: :btree
  add_index "receipts", ["people_id"], name: "index_receipts_on_people_id", using: :btree

  create_table "shelter_staffs", force: true do |t|
    t.integer  "user_id"
    t.integer  "people_id"
    t.string   "staff_type", limit: 11
    t.integer  "shelter_id"
    t.date     "start_date"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shelter_staffs", ["people_id"], name: "index_shelter_staffs_on_people_id", using: :btree
  add_index "shelter_staffs", ["shelter_id"], name: "index_shelter_staffs_on_shelter_id", using: :btree
  add_index "shelter_staffs", ["user_id"], name: "index_shelter_staffs_on_user_id", using: :btree

  create_table "shelters", force: true do |t|
    t.integer  "shelter_id"
    t.string   "name",         limit: 50
    t.string   "shelter_type", limit: 8
    t.string   "address",      limit: 100
    t.string   "city",         limit: 20
    t.string   "province",     limit: 15
    t.string   "postal_code",  limit: 6
    t.string   "phone",        limit: 15
    t.string   "e_mail"
    t.text     "open_hour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surrenders", force: true do |t|
    t.date     "apply_date"
    t.integer  "people_id"
    t.integer  "animal_id"
    t.date     "surrender_date"
    t.boolean  "accepted"
    t.text     "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surrenders", ["animal_id"], name: "index_surrenders_on_animal_id", using: :btree
  add_index "surrenders", ["people_id"], name: "index_surrenders_on_people_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
