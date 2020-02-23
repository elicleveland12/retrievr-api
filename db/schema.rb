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

ActiveRecord::Schema.define(version: 2020_02_23_190518) do

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

  create_table "breeders", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "breeds"
    t.string "litters_to_date"
    t.boolean "verified", default: false
    t.string "champ_bloodlines"
    t.integer "breeder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer "user_id"
    t.string "token"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "litters", force: :cascade do |t|
    t.string "bitch"
    t.string "stud"
    t.string "breed"
    t.string "due_date"
    t.integer "breeder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "message"
    t.integer "poster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "instagram"
    t.string "birthdate"
    t.boolean "missing", default: false
    t.integer "poster_id"
    t.integer "user_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "found", default: false
    t.boolean "sold", default: false
    t.boolean "adopted", default: false
    t.string "species"
    t.boolean "fixed", default: false
    t.string "price"
    t.string "health"
    t.string "sex"
    t.string "number"
    t.integer "litter_id"
    t.string "breed_primary"
    t.string "breed_secondary"
    t.boolean "mixed"
    t.boolean "unknown"
    t.string "color_primary"
    t.string "color_secondary"
    t.string "color_tertiary"
    t.string "size"
  end

  create_table "posters", force: :cascade do |t|
    t.string "lat"
    t.string "long"
    t.integer "pet_id"
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
  end

  create_table "tags", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.boolean "active", default: false
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "finder_radius"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.string "country"
    t.integer "referral_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
