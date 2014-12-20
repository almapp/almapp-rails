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

ActiveRecord::Schema.define(version: 20141219200613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_unities", force: true do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.string   "slug",        null: false
    t.string   "url"
    t.string   "email"
    t.string   "address"
    t.text     "information"
    t.string   "facebook"
    t.string   "twitter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name",  null: false
  end

  add_index "academic_unities", ["faculty_id"], name: "index_academic_unities_on_faculty_id", using: :btree
  add_index "academic_unities", ["slug", "faculty_id"], name: "index_academic_unities_on_slug_and_faculty_id", unique: true, using: :btree

  create_table "assistantships", force: true do |t|
    t.integer  "section_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assistantships", ["section_id"], name: "index_assistantships_on_section_id", using: :btree
  add_index "assistantships", ["user_id"], name: "index_assistantships_on_user_id", using: :btree

  create_table "camp_admins", force: true do |t|
    t.integer  "user_id",                  null: false
    t.integer  "camp_id",                  null: false
    t.string   "appointment", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "camp_admins", ["camp_id"], name: "index_camp_admins_on_camp_id", using: :btree
  add_index "camp_admins", ["user_id"], name: "index_camp_admins_on_user_id", using: :btree

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
  add_index "camps", ["slug", "organization_id"], name: "index_camps_on_slug_and_organization_id", unique: true, using: :btree

  create_table "careers", force: true do |t|
    t.string   "name",              null: false
    t.string   "url"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "curriculum_url"
    t.string   "slug"
    t.integer  "academic_unity_id"
  end

  add_index "careers", ["academic_unity_id"], name: "index_careers_on_academic_unity_id", using: :btree
  add_index "careers", ["slug", "academic_unity_id"], name: "index_careers_on_slug_and_academic_unity_id", unique: true, using: :btree

  create_table "courses", force: true do |t|
    t.string   "initials",                         null: false
    t.string   "name"
    t.integer  "credits"
    t.boolean  "availability",      default: true
    t.text     "description"
    t.integer  "capacity"
    t.integer  "enrolled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "academic_unity_id"
  end

  add_index "courses", ["academic_unity_id"], name: "index_courses_on_academic_unity_id", using: :btree
  add_index "courses", ["initials"], name: "index_courses_on_initials", unique: true, using: :btree
  add_index "courses", ["slug", "academic_unity_id"], name: "index_courses_on_slug_and_academic_unity_id", unique: true, using: :btree

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

  create_table "event_comments", force: true do |t|
    t.integer  "user_id",                 null: false
    t.integer  "event_id",                null: false
    t.text     "comment",    default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_comments", ["event_id"], name: "index_event_comments_on_event_id", using: :btree
  add_index "event_comments", ["user_id"], name: "index_event_comments_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "title",                           null: false
    t.text     "description"
    t.datetime "publish_date"
    t.integer  "place_id"
    t.datetime "from_date"
    t.datetime "to_date",                         null: false
    t.string   "slug",                            null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "organization_id"
    t.integer  "faculty_id"
    t.string   "facebook_url"
    t.string   "external_url"
    t.boolean  "private",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["faculty_id"], name: "index_events_on_faculty_id", using: :btree
  add_index "events", ["group_id"], name: "index_events_on_group_id", using: :btree
  add_index "events", ["organization_id"], name: "index_events_on_organization_id", using: :btree
  add_index "events", ["place_id"], name: "index_events_on_place_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "events_assistances", force: true do |t|
    t.integer  "event_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_assistances", ["event_id"], name: "index_events_assistances_on_event_id", using: :btree
  add_index "events_assistances", ["user_id"], name: "index_events_assistances_on_user_id", using: :btree

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
  add_index "faculties", ["slug", "camp_id"], name: "index_faculties_on_slug_and_camp_id", unique: true, using: :btree

  create_table "faculty_admins", force: true do |t|
    t.integer  "faculty_id",               null: false
    t.integer  "user_id",                  null: false
    t.string   "appointment", default: "", null: false
    t.string   "string",      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faculty_admins", ["faculty_id"], name: "index_faculty_admins_on_faculty_id", using: :btree
  add_index "faculty_admins", ["user_id"], name: "index_faculty_admins_on_user_id", using: :btree

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

  create_table "friendships", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "friend_id",                  null: false
    t.boolean  "accepted",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id", using: :btree

  create_table "group_comments", force: true do |t|
    t.integer  "user_id",                 null: false
    t.integer  "group_id",                null: false
    t.text     "comment",    default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_comments", ["group_id"], name: "index_group_comments_on_group_id", using: :btree
  add_index "group_comments", ["user_id"], name: "index_group_comments_on_user_id", using: :btree

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
  add_index "groups", ["slug"], name: "index_groups_on_slug", unique: true, using: :btree

  create_table "groups_admins", force: true do |t|
    t.integer  "user_id",                  null: false
    t.integer  "group_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "appointment", default: "", null: false
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

  create_table "organization_admins", force: true do |t|
    t.integer  "user_id",                      null: false
    t.integer  "organization_id",              null: false
    t.string   "appointment",     default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_admins", ["organization_id"], name: "index_organization_admins_on_organization_id", using: :btree
  add_index "organization_admins", ["user_id"], name: "index_organization_admins_on_user_id", using: :btree

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
  add_index "places", ["pid", "camp_id"], name: "index_places_on_pid_and_camp_id", unique: true, using: :btree
  add_index "places", ["slug", "camp_id"], name: "index_places_on_slug_and_camp_id", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.text     "content",                default: "",    null: false
    t.integer  "user_id",                                null: false
    t.integer  "group_id"
    t.integer  "faculty_id"
    t.integer  "camp_id"
    t.integer  "organization_id"
    t.integer  "target_group_id"
    t.integer  "target_faculty_id"
    t.integer  "target_camp_id"
    t.integer  "target_organization_id"
    t.integer  "place_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notify",                 default: false, null: false
  end

  add_index "posts", ["camp_id"], name: "index_posts_on_camp_id", using: :btree
  add_index "posts", ["event_id"], name: "index_posts_on_event_id", using: :btree
  add_index "posts", ["faculty_id"], name: "index_posts_on_faculty_id", using: :btree
  add_index "posts", ["group_id"], name: "index_posts_on_group_id", using: :btree
  add_index "posts", ["organization_id"], name: "index_posts_on_organization_id", using: :btree
  add_index "posts", ["place_id"], name: "index_posts_on_place_id", using: :btree
  add_index "posts", ["target_camp_id"], name: "index_posts_on_target_camp_id", using: :btree
  add_index "posts", ["target_faculty_id"], name: "index_posts_on_target_faculty_id", using: :btree
  add_index "posts", ["target_group_id"], name: "index_posts_on_target_group_id", using: :btree
  add_index "posts", ["target_organization_id"], name: "index_posts_on_target_organization_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "schedule_items", force: true do |t|
    t.integer "schedule_module_id"
    t.integer "section_id"
    t.string  "place_name"
    t.string  "class_type"
    t.string  "camp_name"
  end

  add_index "schedule_items", ["schedule_module_id"], name: "index_schedule_items_on_schedule_module_id", using: :btree
  add_index "schedule_items", ["section_id"], name: "index_schedule_items_on_section_id", using: :btree

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
    t.string   "slug"
    t.integer  "academic_unity_id"
  end

  add_index "teachers", ["academic_unity_id"], name: "index_teachers_on_academic_unity_id", using: :btree
  add_index "teachers", ["slug", "academic_unity_id"], name: "index_teachers_on_slug_and_academic_unity_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "username",                               null: false
    t.string   "subdomain",              default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.boolean  "male",                   default: true
    t.string   "country"
    t.string   "student_id"
    t.string   "provider",                               null: false
    t.string   "uid",                    default: "",    null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.text     "tokens"
  end

  add_index "users", ["email", "subdomain"], name: "index_users_on_email_and_subdomain", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug", "organization_id"], name: "index_users_on_slug_and_organization_id", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
