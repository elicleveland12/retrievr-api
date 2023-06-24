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

ActiveRecord::Schema[7.0].define(version: 2023_06_24_152435) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "devices", force: :cascade do |t|
    t.uuid "user_id"
    t.string "token"
    t.string "platform"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "message"
    t.integer "poster_id"
    t.uuid "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "park_visits", force: :cascade do |t|
    t.string "park_id"
    t.integer "pet_id"
    t.integer "count"
    t.datetime "time_in", precision: nil
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "birthdate"
    t.boolean "missing", default: false
    t.integer "poster_id"
    t.uuid "user_id"
    t.string "tag_id"
    t.boolean "found", default: false
    t.string "species"
    t.string "sex"
    t.string "breed_primary"
    t.string "breed_secondary"
    t.string "color_primary"
    t.string "color_secondary"
    t.string "color_tertiary"
    t.text "description"
    t.integer "temperment"
    t.integer "energy_level"
    t.integer "intelligence"
    t.integer "protectiveness"
    t.integer "sharing"
    t.integer "height"
    t.integer "weight"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "posters", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.integer "pet_id"
    t.string "pet_description"
    t.string "poster_name"
    t.string "poster_phone"
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "scans", force: :cascade do |t|
    t.uuid "user_id"
    t.string "tag_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", id: :string, force: :cascade do |t|
    t.boolean "active", default: false
    t.integer "pet_id"
    t.string "tag_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "location"
    t.integer "finder_radius"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "country"
    t.integer "referral_id"
    t.float "latitude"
    t.float "longitude"
    t.integer "reset_password_token"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
