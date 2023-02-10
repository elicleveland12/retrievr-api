# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_28_173640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "devices", force: :cascade do |t|
    t.integer "user_id"
    t.string "token"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "message"
    t.integer "poster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  create_table "park_visits", force: :cascade do |t|
    t.integer "park_id"
    t.string "pet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "count"
  end

  create_table "parks", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "name"
    t.text "description"
    t.string "hours_sunday"
    t.string "hours_monday"
    t.string "hours_tuesday"
    t.string "hours_wednesday"
    t.string "hours_thursday"
    t.string "hours_friday"
    t.string "hours_saturday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tag_id"
    t.string "icon"
  end

  create_table "pets", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.string "instagram"
    t.string "birthdate"
    t.boolean "missing", default: false
    t.integer "poster_id"
    t.string "user_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "found", default: false
    t.string "species"
    t.string "sex"
    t.string "breed_primary"
    t.string "breed_secondary"
    t.string "color_primary"
    t.string "color_secondary"
    t.string "color_tertiary"
    t.integer "temperment"
    t.integer "energy_level"
    t.text "description"
    t.integer "intelligence"
    t.integer "protectiveness"
    t.integer "sharing"
    t.integer "height"
    t.integer "weight"
  end

  create_table "posters", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "pet_id"
    t.string "pet_description"
    t.string "poster_name"
    t.string "poster_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "found_lat"
    t.string "found_long"
    t.string "comment"
    t.string "missing_time"
    t.string "additional_info"
    t.integer "message_id"
    t.string "reward"
    t.boolean "status", default: true
    t.boolean "returned", default: false
    t.string "returned_state"
    t.string "returned_comment"
    t.string "returned_timestamp"
    t.string "address"
  end

  create_table "scans", force: :cascade do |t|
    t.string "user_id"
    t.string "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "count"
  end

  create_table "tags", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.boolean "active", default: false
    t.string "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "park_id"
    t.string "tag_type"
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "finder_radius"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "country"
    t.integer "referral_id"
    t.float "latitude"
    t.float "longitude"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
