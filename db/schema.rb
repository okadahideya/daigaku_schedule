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

ActiveRecord::Schema.define(version: 2021_01_01_064423) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "professor_id"
    t.bigint "question_id"
    t.text "answer_text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["professor_id"], name: "index_answers_on_professor_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "lecture_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "professor_id"
    t.bigint "lecture_id"
    t.date "lecture_date", null: false
    t.string "lecture_title_list", null: false
    t.text "lecture_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecture_id"], name: "index_lecture_details_on_lecture_id"
    t.index ["professor_id"], name: "index_lecture_details_on_professor_id"
  end

  create_table "lectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "professor_id"
    t.string "lecture_title", null: false
    t.text "contents", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["professor_id"], name: "index_lectures_on_professor_id"
  end

  create_table "professors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name_p", null: false
    t.string "name_k_p", null: false
    t.string "university_p", null: false
    t.string "undergraduate_p", null: false
    t.string "department_p", null: false
    t.text "professors_detail"
    t.string "qualification"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_professors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_professors_on_reset_password_token", unique: true
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lecture_detail_id"
    t.text "question_text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecture_detail_id"], name: "index_questions_on_lecture_detail_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title", null: false
    t.date "start_time", null: false
    t.text "text"
    t.string "area"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "subject_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "subject_id"
    t.string "curriculum", null: false
    t.integer "unit", null: false
    t.integer "select_genre_id", null: false
    t.integer "week_genre_id", null: false
    t.integer "time_genre_id", null: false
    t.integer "result_genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_subject_details_on_subject_id"
    t.index ["user_id"], name: "index_subject_details_on_user_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "period_genre_id", null: false
    t.integer "grade_genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_subjects_on_user_id"
  end

  create_table "submissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lecture_detail_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lecture_detail_id"], name: "index_submissions_on_lecture_detail_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "name_k", null: false
    t.string "nickname", null: false
    t.string "university", null: false
    t.string "undergraduate", null: false
    t.string "department", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "professors"
  add_foreign_key "answers", "questions"
  add_foreign_key "lecture_details", "lectures"
  add_foreign_key "lecture_details", "professors"
  add_foreign_key "lectures", "professors"
  add_foreign_key "questions", "lecture_details"
  add_foreign_key "questions", "users"
  add_foreign_key "schedules", "users"
  add_foreign_key "subject_details", "subjects"
  add_foreign_key "subject_details", "users"
  add_foreign_key "subjects", "users"
  add_foreign_key "submissions", "lecture_details"
  add_foreign_key "submissions", "users"
end
