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

ActiveRecord::Schema.define(version: 2022102807) do

  create_table "activities", primary_key: "aid", force: :cascade do |t|
    t.string   "status"
    t.integer  "coupon_id"
    t.datetime "datetime"
    t.integer  "fst_uid"
    t.boolean  "fst_accept"
    t.integer  "snd_uid"
    t.boolean  "snd_accept"
  end

  create_table "coupons", primary_key: "cid", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.string "location"
    t.string "original_price"
    t.string "discount_price"
    t.string "advertiser"
  end

  create_table "interests", primary_key: "uid", force: :cascade do |t|
    t.string "interest1"
    t.string "interest2"
    t.string "interest3"
  end

  create_table "messages", primary_key: "mid", force: :cascade do |t|
    t.integer  "sender_uid"
    t.integer  "receiver_uid"
    t.datetime "timestamp"
    t.string   "message"
    t.boolean  "is_read"
  end

  create_table "prompts", primary_key: "uid", force: :cascade do |t|
    t.string "answer1"
    t.string "answer2"
    t.string "answer3"
  end

  create_table "user_photos", id: false, force: :cascade do |t|
    t.integer "uid"
    t.string  "link"
  end

  create_table "users", primary_key: "uid", force: :cascade do |t|
    t.string   "phone"
    t.string   "password"
    t.string   "name"
    t.string   "gender"
    t.string   "sexuality"
    t.datetime "birthday"
    t.string   "location"
    t.string   "education"
    t.string   "career"
    t.string   "height"
    t.string   "profile_photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
