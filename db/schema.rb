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

ActiveRecord::Schema.define(version: 2020_09_09_115825) do

  create_table "checkers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "medicine_id"
    t.datetime "check_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "timing"
    t.decimal "dose", precision: 10, scale: 2
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "usage"
    t.integer "days"
    t.decimal "dose", precision: 10, scale: 2
    t.text "effect"
    t.text "side_effect"
    t.bigint "prescription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "medicine_type"
    t.string "detail_type"
    t.text "free_comment"
    t.integer "times"
    t.index ["prescription_id"], name: "index_medicines_on_prescription_id"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "visiter_id"
    t.integer "visited_id"
    t.integer "item_id"
    t.integer "comment_id"
    t.string "action"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prescriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "visit_date"
    t.string "hospital"
    t.string "doctor"
    t.string "pharmacy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
    t.integer "age"
    t.boolean "admin", default: false
    t.integer "sexes"
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
