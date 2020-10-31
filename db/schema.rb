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

ActiveRecord::Schema.define(version: 2020_10_31_162729) do

  create_table "material_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.integer "material_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_category_id"], name: "index_materials_on_material_category_id"
  end

  create_table "planers", force: :cascade do |t|
    t.string "day"
    t.integer "recept_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recept_id"], name: "index_planers_on_recept_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "material_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_products_on_material_id"
  end

  create_table "recept_connects", force: :cascade do |t|
    t.integer "recept_id", null: false
    t.integer "material_id", null: false
    t.integer "size_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_recept_connects_on_material_id"
    t.index ["recept_id"], name: "index_recept_connects_on_recept_id"
    t.index ["size_id"], name: "index_recept_connects_on_size_id"
  end

  create_table "recept_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recepts", force: :cascade do |t|
    t.string "name"
    t.integer "recept_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recept_type_id"], name: "index_recepts_on_recept_type_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "materials", "material_categories"
  add_foreign_key "planers", "recepts"
  add_foreign_key "products", "materials"
  add_foreign_key "recept_connects", "materials"
  add_foreign_key "recept_connects", "recepts"
  add_foreign_key "recept_connects", "sizes"
  add_foreign_key "recepts", "recept_types"
end
