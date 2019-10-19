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

ActiveRecord::Schema.define(version: 2019_10_08_090544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "unconfirmed_email"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assigned_id"
    t.string "assigned_type"
  end

  create_table "departments", force: :cascade do |t|
    t.text "name"
    t.bigint "hod_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hod_id"], name: "index_departments_on_hod_id", unique: true
  end

  create_table "exams", force: :cascade do |t|
    t.text "name"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "images", force: :cascade do |t|
    t.text "image_path"
    t.integer "image_profile_id"
    t.string "image_profile_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.text "name"
    t.bigint "department_id"
    t.bigint "co_ordinator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["co_ordinator_id"], name: "index_sections_on_co_ordinator_id"
    t.index ["department_id"], name: "index_sections_on_department_id"
  end

  create_table "sections_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "section_id", null: false
    t.index ["section_id"], name: "index_sections_teachers_on_section_id"
    t.index ["teacher_id"], name: "index_sections_teachers_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.text "name"
    t.date "date_of_birth"
    t.integer "year"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "assigned_type"
    t.bigint "assigned_id"
    t.integer "percentage"
    t.index ["assigned_type", "assigned_id"], name: "index_students_on_assigned_type_and_assigned_id"
    t.index ["section_id"], name: "index_students_on_section_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.text "name"
    t.integer "year"
    t.text "type"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_subjects_on_department_id"
  end

  create_table "subjects_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.index ["subject_id"], name: "index_subjects_teachers_on_subject_id"
    t.index ["teacher_id"], name: "index_subjects_teachers_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.text "name"
    t.date "date_of_birth"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supervisor_id"
    t.string "assigned_type"
    t.bigint "assigned_id"
    t.index ["assigned_type", "assigned_id"], name: "index_teachers_on_assigned_type_and_assigned_id"
    t.index ["supervisor_id"], name: "index_teachers_on_supervisor_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.bigint "phone"
    t.text "gender"
    t.text "address"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "city"
    t.text "state"
    t.text "country"
    t.boolean "accepted_tos"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "new_att1"
    t.integer "new_att2"
    t.date "new_att3"
    t.string "profile_picture"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
