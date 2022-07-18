# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_11_100345) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animated_blocks", force: :cascade do |t|
    t.bigint "animated_gif_id", null: false
    t.string "block_word", limit: 9
    t.string "block_style", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animated_gif_id"], name: "index_animated_blocks_on_animated_gif_id"
  end

  create_table "animated_gifs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_animated_gifs_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "eth_address"
    t.string "nonce_digest"
    t.datetime "nonce_at"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "animated_blocks", "animated_gifs"
  add_foreign_key "animated_gifs", "users"
end
