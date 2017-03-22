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

ActiveRecord::Schema.define(version: 20170319235315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.string   "description"
    t.boolean  "right"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "course_modules", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "course_id"
    t.string   "youtube_link"
    t.text     "description"
    t.index ["course_id"], name: "index_course_modules_on_course_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "no_resolution"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "modality_id"
    t.string   "resolution_file_name"
    t.string   "resolution_content_type"
    t.integer  "resolution_file_size"
    t.datetime "resolution_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.date     "start_date",              null: false
    t.date     "finish_date",             null: false
    t.text     "description"
    t.string   "summary"
    t.date     "start_inscription_date"
    t.date     "finish_inscription_date"
    t.index ["modality_id"], name: "index_courses_on_modality_id", using: :btree
  end

  create_table "courses_people", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_inscriptions_on_course_id", using: :btree
    t.index ["person_id"], name: "index_inscriptions_on_person_id", using: :btree
  end

  create_table "modalities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "people", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "province_id"
    t.string  "type"
    t.string  "dni",         null: false
    t.index ["dni"], name: "index_people_on_dni", unique: true, using: :btree
    t.index ["province_id"], name: "index_people_on_province_id", using: :btree
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "quiz_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "pass_points"
    t.integer  "time_in_seconds"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "course_module_id"
    t.index ["course_module_id"], name: "index_quizzes_on_course_module_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
    t.integer  "person_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["person_id"], name: "index_users_on_person_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "course_modules", "courses"
  add_foreign_key "courses", "modalities"
  add_foreign_key "inscriptions", "courses"
  add_foreign_key "inscriptions", "people"
  add_foreign_key "people", "provinces"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "course_modules"
  add_foreign_key "users", "people"
  add_foreign_key "users", "roles"
end
