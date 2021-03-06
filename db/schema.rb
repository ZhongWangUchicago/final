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

ActiveRecord::Schema.define(version: 0) do

  create_table "comments", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "picture_id"
    t.datetime "time_posted"
    t.string   "content"
  end

  add_index "comments", ["customer_id"], name: "index_comments_on_customer_id"
  add_index "comments", ["picture_id"], name: "index_comments_on_picture_id"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "reviewer_id"
    t.datetime "time_posted"
    t.string   "file_location"
  end

  add_index "pictures", ["reviewer_id"], name: "index_pictures_on_reviewer_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "reviewer_id"
    t.string   "title"
    t.datetime "time_posted"
    t.string   "content"
  end

  add_index "reservations", ["reviewer_id"], name: "index_reservations_on_reviewer_id"

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "reviewers", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "customer_id"
    t.boolean "admin",         default: false
  end

  add_index "reviewers", ["customer_id"], name: "index_reviewers_on_customer_id"
  add_index "reviewers", ["restaurant_id"], name: "index_reviewers_on_restaurant_id"

end
