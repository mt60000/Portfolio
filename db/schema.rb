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

ActiveRecord::Schema.define(version: 2021_11_09_001607) do

  create_table "applies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_applies_on_group_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "authorities", force: :cascade do |t|
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "diary_id"
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_comments_on_diary_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "mood_id", null: false
    t.string "keep"
    t.string "problem"
    t.string "try"
    t.text "text"
    t.string "image_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_favorites_on_diary_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "group_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_diary_id"
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_diary_id"], name: "index_group_comments_on_group_diary_id"
    t.index ["user_id"], name: "index_group_comments_on_user_id"
  end

  create_table "group_diaries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.integer "mood_id", null: false
    t.string "keep"
    t.string "problem"
    t.string "try"
    t.text "text"
    t.string "image_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_diaries_on_group_id"
    t.index ["user_id"], name: "index_group_diaries_on_user_id"
  end

  create_table "group_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_diary_id"], name: "index_group_favorites_on_group_diary_id"
    t.index ["user_id"], name: "index_group_favorites_on_user_id"
  end

  create_table "group_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.string "authority_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "policy"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moods", force: :cascade do |t|
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "visitor_id", null: false
    t.integer "visited_id", null: false
    t.integer "apply_id"
    t.integer "group_id"
    t.integer "group_diary_id"
    t.integer "group_favorite_id"
    t.integer "group_comment_id"
    t.string "action", default: "", null: false
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apply_id"], name: "index_notifications_on_apply_id"
    t.index ["group_comment_id"], name: "index_notifications_on_group_comment_id"
    t.index ["group_diary_id"], name: "index_notifications_on_group_diary_id"
    t.index ["group_favorite_id"], name: "index_notifications_on_group_favorite_id"
    t.index ["group_id"], name: "index_notifications_on_group_id"
    t.index ["visited_id"], name: "index_notifications_on_visited_id"
    t.index ["visitor_id"], name: "index_notifications_on_visitor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "policy"
    t.string "profile_image_id"
    t.boolean "is_valid", default: true, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
