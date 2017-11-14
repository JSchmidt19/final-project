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

ActiveRecord::Schema.define(version: 20171107191154) do

  create_table "fact_tags", force: :cascade do |t|
    t.integer  "fact_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fact_id"], name: "index_fact_tags_on_fact_id"
    t.index ["tag_id"], name: "index_fact_tags_on_tag_id"
  end

  create_table "facts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "fact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pot_images", force: :cascade do |t|
    t.integer  "pot_id"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pot_id"], name: "index_pot_images_on_pot_id"
  end

  create_table "pots", force: :cascade do |t|
    t.integer  "pot_id"
    t.string   "title"
    t.text     "description"
    t.float    "price"
    t.string   "size"
    t.string   "color"
    t.string   "style"
    t.string   "glazes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
