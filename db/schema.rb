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

ActiveRecord::Schema.define(version: 2020_05_12_101633) do

  create_table "carmakers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "maker", null: false
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "explanation"
  end

  create_table "cars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "car_type"
    t.text "image"
    t.float "WLTP_range"
    t.float "EPA_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "carmaker_id"
    t.index ["carmaker_id"], name: "index_cars_on_carmaker_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.string "temperature", null: false
    t.string "weather", null: false
    t.string "driving_status", null: false
    t.string "driving_mode", null: false
    t.integer "distance", null: false
    t.integer "consumption", null: false
    t.text "image"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "carmaker_id"
    t.bigint "car_id"
    t.string "AC"
    t.integer "AC_temperature"
    t.index ["car_id"], name: "index_posts_on_car_id"
    t.index ["carmaker_id"], name: "index_posts_on_carmaker_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.bigint "carmaker_id"
    t.bigint "car_id"
    t.string "image"
    t.boolean "admin", default: false
    t.index ["car_id"], name: "index_users_on_car_id"
    t.index ["carmaker_id"], name: "index_users_on_carmaker_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "carmakers"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "posts", "carmakers"
  add_foreign_key "posts", "cars"
  add_foreign_key "posts", "users"
  add_foreign_key "users", "carmakers"
  add_foreign_key "users", "cars"
end
