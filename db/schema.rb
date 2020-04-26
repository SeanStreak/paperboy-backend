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

ActiveRecord::Schema.define(version: 2020_04_26_063926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connection_inboxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_connection_inboxes_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "other_user_id"
    t.index ["other_user_id"], name: "index_connections_on_other_user_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "inboxes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_inboxes_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "inbox_id"
    t.string "status"
    t.index ["inbox_id"], name: "index_notes_on_inbox_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.string "completion_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "inbox_id"
    t.string "status"
    t.index ["inbox_id"], name: "index_tasks_on_inbox_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "inlink"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "connection_inboxes", "users"
  add_foreign_key "connections", "users"
  add_foreign_key "connections", "users", column: "other_user_id"
  add_foreign_key "inboxes", "users"
  add_foreign_key "notes", "inboxes"
  add_foreign_key "notes", "users"
  add_foreign_key "tasks", "inboxes"
  add_foreign_key "tasks", "users"
end
