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

ActiveRecord::Schema.define(version: 20160830163322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptances", force: true do |t|
    t.integer  "sitter_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acceptances", ["proposal_id"], name: "index_acceptances_on_proposal_id", using: :btree
  add_index "acceptances", ["sitter_id"], name: "index_acceptances_on_sitter_id", using: :btree

  create_table "animals", force: true do |t|
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "zip"
    t.integer  "owner_rating"
    t.integer  "sitter_rating"
    t.integer  "owner_id"
    t.integer  "sitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["owner_id"], name: "index_jobs_on_owner_id", using: :btree
  add_index "jobs", ["sitter_id"], name: "index_jobs_on_sitter_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "zip"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "picture"
    t.integer  "animal_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets", ["animal_id"], name: "index_pets_on_animal_id", using: :btree
  add_index "pets", ["owner_id"], name: "index_pets_on_owner_id", using: :btree

  create_table "prefences", force: true do |t|
    t.integer  "animal_id"
    t.integer  "sitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prefences", ["animal_id"], name: "index_prefences_on_animal_id", using: :btree
  add_index "prefences", ["sitter_id"], name: "index_prefences_on_sitter_id", using: :btree

  create_table "proposals", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "zip"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposals", ["owner_id"], name: "index_proposals_on_owner_id", using: :btree

  create_table "sitters", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "zip"
    t.string   "phone"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "watches", force: true do |t|
    t.integer  "pet_id"
    t.integer  "watchable_id"
    t.string   "watchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watches", ["pet_id"], name: "index_watches_on_pet_id", using: :btree
  add_index "watches", ["watchable_id", "watchable_type"], name: "index_watches_on_watchable_id_and_watchable_type", using: :btree

end
