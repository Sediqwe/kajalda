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

ActiveRecord::Schema.define(version: 2020_11_01_205457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "postgis_tiger_geocoder"
  enable_extension "postgis_topology"

  create_table "addr", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.bigint "tlid"
    t.string "fromhn", limit: 12
    t.string "tohn", limit: 12
    t.string "side", limit: 1
    t.string "zip", limit: 5
    t.string "plus4", limit: 4
    t.string "fromtyp", limit: 1
    t.string "totyp", limit: 1
    t.integer "fromarmid"
    t.integer "toarmid"
    t.string "arid", limit: 22
    t.string "mtfcc", limit: 5
    t.string "statefp", limit: 2
    t.index ["tlid", "statefp"], name: "idx_tiger_addr_tlid_statefp"
    t.index ["zip"], name: "idx_tiger_addr_zip"
  end

# Could not dump table "addrfeat" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bg" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "county" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "county_lookup", primary_key: ["st_code", "co_code"], force: :cascade do |t|
    t.integer "st_code", null: false
    t.string "state", limit: 2
    t.integer "co_code", null: false
    t.string "name", limit: 90
    t.index "soundex((name)::text)", name: "county_lookup_name_idx"
    t.index ["state"], name: "county_lookup_state_idx"
  end

  create_table "countysub_lookup", primary_key: ["st_code", "co_code", "cs_code"], force: :cascade do |t|
    t.integer "st_code", null: false
    t.string "state", limit: 2
    t.integer "co_code", null: false
    t.string "county", limit: 90
    t.integer "cs_code", null: false
    t.string "name", limit: 90
    t.index "soundex((name)::text)", name: "countysub_lookup_name_idx"
    t.index ["state"], name: "countysub_lookup_state_idx"
  end

# Could not dump table "cousub" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "direction_lookup", primary_key: "name", id: :string, limit: 20, force: :cascade do |t|
    t.string "abbrev", limit: 3
    t.index ["abbrev"], name: "direction_lookup_abbrev_idx"
  end

# Could not dump table "edges" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "faces" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "featnames", primary_key: "gid", id: :serial, force: :cascade do |t|
    t.bigint "tlid"
    t.string "fullname", limit: 100
    t.string "name", limit: 100
    t.string "predirabrv", limit: 15
    t.string "pretypabrv", limit: 50
    t.string "prequalabr", limit: 15
    t.string "sufdirabrv", limit: 15
    t.string "suftypabrv", limit: 50
    t.string "sufqualabr", limit: 15
    t.string "predir", limit: 2
    t.string "pretyp", limit: 3
    t.string "prequal", limit: 2
    t.string "sufdir", limit: 2
    t.string "suftyp", limit: 3
    t.string "sufqual", limit: 2
    t.string "linearid", limit: 22
    t.string "mtfcc", limit: 5
    t.string "paflag", limit: 1
    t.string "statefp", limit: 2
    t.index "lower((name)::text)", name: "idx_tiger_featnames_lname"
    t.index "soundex((name)::text)", name: "idx_tiger_featnames_snd_name"
    t.index ["tlid", "statefp"], name: "idx_tiger_featnames_tlid_statefp"
  end

  create_table "geocode_settings", primary_key: "name", id: :text, force: :cascade do |t|
    t.text "setting"
    t.text "unit"
    t.text "category"
    t.text "short_desc"
  end

  create_table "geocode_settings_default", primary_key: "name", id: :text, force: :cascade do |t|
    t.text "setting"
    t.text "unit"
    t.text "category"
    t.text "short_desc"
  end

  create_table "loader_lookuptables", primary_key: "lookup_name", id: :text, force: :cascade do |t|
    t.integer "process_order", default: 1000, null: false
    t.text "table_name", comment: "suffix of the tables to load e.g.  edges would load all tables like *edges.dbf(shp)  -- so tl_2010_42129_edges.dbf .  "
    t.boolean "single_mode", default: true, null: false
    t.boolean "load", default: true, null: false, comment: "Whether or not to load the table.  For states and zcta5 (you may just want to download states10, zcta510 nationwide file manually) load your own into a single table that inherits from tiger.states, tiger.zcta5.  You'll get improved performance for some geocoding cases."
    t.boolean "level_county", default: false, null: false
    t.boolean "level_state", default: false, null: false
    t.boolean "level_nation", default: false, null: false, comment: "These are tables that contain all data for the whole US so there is just a single file"
    t.text "post_load_process"
    t.boolean "single_geom_mode", default: false
    t.string "insert_mode", limit: 1, default: "c", null: false
    t.text "pre_load_process"
    t.text "columns_exclude", comment: "List of columns to exclude as an array. This is excluded from both input table and output table and rest of columns remaining are assumed to be in same order in both tables. gid, geoid,cpi,suffix1ce are excluded if no columns are specified.", array: true
    t.text "website_root_override", comment: "Path to use for wget instead of that specified in year table.  Needed currently for zcta where they release that only for 2000 and 2010"
  end

  create_table "loader_platform", primary_key: "os", id: :string, limit: 50, force: :cascade do |t|
    t.text "declare_sect"
    t.text "pgbin"
    t.text "wget"
    t.text "unzip_command"
    t.text "psql"
    t.text "path_sep"
    t.text "loader"
    t.text "environ_set_command"
    t.text "county_process_command"
  end

  create_table "loader_variables", primary_key: "tiger_year", id: :string, limit: 4, force: :cascade do |t|
    t.text "website_root"
    t.text "staging_fold"
    t.text "data_schema"
    t.text "staging_schema"
  end

  create_table "material_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.bigint "material_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_category_id"], name: "index_materials_on_material_category_id"
  end

  create_table "pagc_gaz", id: :serial, force: :cascade do |t|
    t.integer "seq"
    t.text "word"
    t.text "stdword"
    t.integer "token"
    t.boolean "is_custom", default: true, null: false
  end

  create_table "pagc_lex", id: :serial, force: :cascade do |t|
    t.integer "seq"
    t.text "word"
    t.text "stdword"
    t.integer "token"
    t.boolean "is_custom", default: true, null: false
  end

  create_table "pagc_rules", id: :serial, force: :cascade do |t|
    t.text "rule"
    t.boolean "is_custom", default: true
  end

# Could not dump table "place" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "place_lookup", primary_key: ["st_code", "pl_code"], force: :cascade do |t|
    t.integer "st_code", null: false
    t.string "state", limit: 2
    t.integer "pl_code", null: false
    t.string "name", limit: 90
    t.index "soundex((name)::text)", name: "place_lookup_name_idx"
    t.index ["state"], name: "place_lookup_state_idx"
  end

  create_table "planers", force: :cascade do |t|
    t.string "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planers_recepts", force: :cascade do |t|
    t.bigint "planer_id", null: false
    t.bigint "recept_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planer_id"], name: "index_planers_recepts_on_planer_id"
    t.index ["recept_id"], name: "index_planers_recepts_on_recept_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "material_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_products_on_material_id"
  end

  create_table "recept_connects", force: :cascade do |t|
    t.bigint "recept_id", null: false
    t.bigint "material_id", null: false
    t.bigint "size_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit"
    t.float "amount"
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
    t.bigint "recept_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recept_type_id"], name: "index_recepts_on_recept_type_id"
  end

  create_table "secondary_unit_lookup", primary_key: "name", id: :string, limit: 20, force: :cascade do |t|
    t.string "abbrev", limit: 5
    t.index ["abbrev"], name: "secondary_unit_lookup_abbrev_idx"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
  end

# Could not dump table "state" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "state_lookup", primary_key: "st_code", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 40
    t.string "abbrev", limit: 3
    t.string "statefp", limit: 2
    t.index ["abbrev"], name: "state_lookup_abbrev_key", unique: true
    t.index ["name"], name: "state_lookup_name_key", unique: true
    t.index ["statefp"], name: "state_lookup_statefp_key", unique: true
  end

  create_table "street_type_lookup", primary_key: "name", id: :string, limit: 50, force: :cascade do |t|
    t.string "abbrev", limit: 50
    t.boolean "is_hw", default: false, null: false
    t.index ["abbrev"], name: "street_type_lookup_abbrev_idx"
  end

# Could not dump table "tabblock" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "tract" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "zcta5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "zip_lookup", primary_key: "zip", id: :integer, default: nil, force: :cascade do |t|
    t.integer "st_code"
    t.string "state", limit: 2
    t.integer "co_code"
    t.string "county", limit: 90
    t.integer "cs_code"
    t.string "cousub", limit: 90
    t.integer "pl_code"
    t.string "place", limit: 90
    t.integer "cnt"
  end

  create_table "zip_lookup_all", id: false, force: :cascade do |t|
    t.integer "zip"
    t.integer "st_code"
    t.string "state", limit: 2
    t.integer "co_code"
    t.string "county", limit: 90
    t.integer "cs_code"
    t.string "cousub", limit: 90
    t.integer "pl_code"
    t.string "place", limit: 90
    t.integer "cnt"
  end

  create_table "zip_lookup_base", primary_key: "zip", id: :string, limit: 5, force: :cascade do |t|
    t.string "state", limit: 40
    t.string "county", limit: 90
    t.string "city", limit: 90
    t.string "statefp", limit: 2
  end

  create_table "zip_state", primary_key: ["zip", "stusps"], force: :cascade do |t|
    t.string "zip", limit: 5, null: false
    t.string "stusps", limit: 2, null: false
    t.string "statefp", limit: 2
  end

  create_table "zip_state_loc", primary_key: ["zip", "stusps", "place"], force: :cascade do |t|
    t.string "zip", limit: 5, null: false
    t.string "stusps", limit: 2, null: false
    t.string "statefp", limit: 2
    t.string "place", limit: 100, null: false
  end

  add_foreign_key "materials", "material_categories"
  add_foreign_key "planers_recepts", "planers"
  add_foreign_key "planers_recepts", "recepts"
  add_foreign_key "products", "materials"
  add_foreign_key "recept_connects", "materials"
  add_foreign_key "recept_connects", "recepts"
  add_foreign_key "recepts", "recept_types"
end
