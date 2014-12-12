# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141212230004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistantships", force: true do |t|
    t.integer  "section_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assistantships", ["section_id"], name: "index_assistantships_on_section_id", using: :btree
  add_index "assistantships", ["user_id"], name: "index_assistantships_on_user_id", using: :btree

  create_table "camps", force: true do |t|
    t.string   "cid",                           null: false
    t.string   "name",                          null: false
    t.integer  "organization_id",               null: false
    t.string   "address"
    t.string   "url"
    t.text     "description"
    t.string   "icon"
    t.float    "zoom",            default: 0.0
    t.float    "angle",           default: 0.0
    t.float    "tilt",            default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "phone"
    t.string   "email"
    t.float    "latitude",        default: 0.0
    t.float    "longitude",       default: 0.0
    t.string   "slug"
  end

  add_index "camps", ["cid"], name: "index_camps_on_cid", unique: true, using: :btree
  add_index "camps", ["organization_id"], name: "index_camps_on_organization_id", using: :btree

  create_table "careers", force: true do |t|
    t.string   "name",           null: false
    t.string   "url"
    t.text     "information"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "curriculum_url"
    t.string   "slug"
  end

  add_index "careers", ["faculty_id"], name: "index_careers_on_faculty_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "initials",                    null: false
    t.string   "name"
    t.integer  "credits"
    t.boolean  "availability", default: true
    t.text     "description"
    t.integer  "capacity"
    t.integer  "enrolled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_id"
    t.string   "slug"
  end

  add_index "courses", ["faculty_id"], name: "index_courses_on_faculty_id", using: :btree
  add_index "courses", ["initials"], name: "index_courses_on_initials", unique: true, using: :btree

  create_table "enrolled_careers", force: true do |t|
    t.integer  "user_id"
    t.integer  "career_id"
    t.string   "curriculum"
    t.date     "ingress"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrolled_careers", ["career_id"], name: "index_enrolled_careers_on_career_id", using: :btree
  add_index "enrolled_careers", ["user_id"], name: "index_enrolled_careers_on_user_id", using: :btree

  create_table "faculties", force: true do |t|
    t.string   "fid",                       null: false
    t.string   "name",                      null: false
    t.integer  "camp_id"
    t.string   "address"
    t.string   "url"
    t.text     "description"
    t.string   "icon"
    t.float    "zoom",        default: 0.0
    t.float    "angle",       default: 0.0
    t.float    "tilt",        default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "phone"
    t.string   "email"
    t.string   "floor"
    t.float    "latitude",    default: 0.0
    t.float    "longitude",   default: 0.0
    t.string   "slug"
    t.string   "short_name",                null: false
  end

  add_index "faculties", ["camp_id"], name: "index_faculties_on_camp_id", using: :btree
  add_index "faculties", ["fid"], name: "index_faculties_on_fid", unique: true, using: :btree
  add_index "faculties", ["name"], name: "index_faculties_on_name", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "email",           null: false
    t.string   "url"
    t.string   "facebook"
    t.string   "twitter"
    t.text     "information"
    t.date     "expiration"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_id"
    t.string   "slug"
  end

  add_index "groups", ["faculty_id"], name: "index_groups_on_faculty_id", using: :btree
  add_index "groups", ["organization_id"], name: "index_groups_on_organization_id", using: :btree

  create_table "groups_admins", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups_admins", ["group_id"], name: "index_groups_admins_on_group_id", using: :btree
  add_index "groups_admins", ["user_id"], name: "index_groups_admins_on_user_id", using: :btree

  create_table "groups_subscribers", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "visible_mail",  default: false
    t.boolean  "notifications", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups_subscribers", ["group_id"], name: "index_groups_subscribers_on_group_id", using: :btree
  add_index "groups_subscribers", ["user_id"], name: "index_groups_subscribers_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name",        null: false
    t.text     "information"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "slug",        null: false
  end

  create_table "places", force: true do |t|
    t.string   "pid",                        null: false
    t.string   "name"
    t.integer  "faculty_id"
    t.string   "floor"
    t.string   "icon"
    t.text     "description"
    t.float    "zoom",        default: 0.0
    t.float    "angle",       default: 0.0
    t.float    "tilt",        default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_id"
    t.float    "latitude",    default: 0.0
    t.float    "longitude",   default: 0.0
    t.boolean  "gmaps",       default: true
    t.string   "slug"
  end

  add_index "places", ["camp_id"], name: "index_places_on_camp_id", using: :btree
  add_index "places", ["faculty_id"], name: "index_places_on_faculty_id", using: :btree
  add_index "places", ["pid"], name: "index_places_on_pid", unique: true, using: :btree

  create_table "schedule_items", id: false, force: true do |t|
    t.integer  "schedule_module_id", null: false
    t.integer  "section_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
    t.string   "class_type"
  end

  add_index "schedule_items", ["place_id"], name: "index_schedule_items_on_place_id", using: :btree

  create_table "schedule_modules", force: true do |t|
    t.string  "initials",   null: false
    t.integer "day",        null: false
    t.integer "block",      null: false
    t.string  "start_time", null: false
    t.string  "end_time",   null: false
  end

  add_index "schedule_modules", ["initials"], name: "index_schedule_modules_on_initials", unique: true, using: :btree

  create_table "sections", force: true do |t|
    t.integer  "course_id"
    t.integer  "number",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester",   null: false
    t.integer  "year",       null: false
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id", using: :btree

  create_table "sections_teachers", id: false, force: true do |t|
    t.integer  "teacher_id", null: false
    t.integer  "section_id", null: false
    t.integer  "year"
    t.integer  "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections_users", id: false, force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "section_id", null: false
    t.integer  "year"
    t.integer  "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "information"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_id"
    t.string   "slug"
    t.string   "username",    null: false
  end

  add_index "teachers", ["faculty_id"], name: "index_teachers_on_faculty_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",           null: false
    t.string   "password_digest"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "username",        null: false
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

end
