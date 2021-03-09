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

ActiveRecord::Schema.define(version: 2021_03_09_093623) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "coupon_code"
    t.bigint "user_id"
    t.bigint "movie_id"
    t.integer "total_fee"
    t.integer "seat_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_bookings_on_movie_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "coupons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.integer "coupon_count"
    t.integer "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movie_id"
    t.index ["movie_id"], name: "index_coupons_on_movie_id"
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "language"
    t.bigint "screen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["screen_id"], name: "index_movies_on_screen_id"
  end

  create_table "screens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "date"
    t.integer "fee"
    t.bigint "theatre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seat_id"
    t.bigint "timing_id"
    t.index ["seat_id"], name: "index_screens_on_seat_id"
    t.index ["theatre_id"], name: "index_screens_on_theatre_id"
    t.index ["timing_id"], name: "index_screens_on_timing_id"
  end

  create_table "seats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "seat_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theatres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "gender"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "movies"
  add_foreign_key "bookings", "users"
  add_foreign_key "coupons", "movies"
  add_foreign_key "movies", "screens"
  add_foreign_key "screens", "seats"
  add_foreign_key "screens", "theatres"
  add_foreign_key "screens", "timings"
end
