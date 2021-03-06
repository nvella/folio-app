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

ActiveRecord::Schema.define(version: 20161007122819) do

  create_table "captions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "folio_page_id"
  end

  create_table "folio_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "folio_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folio_page_row_columns", force: :cascade do |t|
    t.integer  "folio_id"
    t.integer  "folio_page_id"
    t.integer  "folio_page_row_id"
    t.integer  "column_order"
    t.integer  "column_width"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "image_id"
    t.integer  "caption_id"
  end

  create_table "folio_page_rows", force: :cascade do |t|
    t.integer  "folio_id"
    t.integer  "folio_page_id"
    t.integer  "row_order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "folio_pages", force: :cascade do |t|
    t.integer  "folio_id"
    t.integer  "page_order"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folios", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "tags"
    t.index ["user_id"], name: "index_folios_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "folio_page_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "bio"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "image"
  end

end
