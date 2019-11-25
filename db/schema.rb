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

ActiveRecord::Schema.define(version: 20191125014555) do

  create_table "questions", force: :cascade do |t|
    t.string "problem", null: false
    t.string "category", null: false
    t.string "correct_answer", null: false
    t.string "incorrect_answer_one", null: false
    t.string "incorrect_answer_two", null: false
    t.string "incorrect_answer_three", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["room_id"], name: "index_questions_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "category"
    t.string "result"
    t.boolean "isactive", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "host_id", null: false
    t.integer "guest_id"
    t.index ["guest_id"], name: "index_rooms_on_guest_id"
    t.index ["host_id"], name: "index_rooms_on_host_id"
  end

  create_table "selections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "question_id"
    t.index ["question_id"], name: "index_selections_on_question_id"
    t.index ["user_id"], name: "index_selections_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
