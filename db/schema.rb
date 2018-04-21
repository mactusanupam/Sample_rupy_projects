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

ActiveRecord::Schema.define(version: 20180420080809) do

  create_table "academic_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "institute"
    t.string "university"
    t.boolean "pursuing"
    t.date "start_date"
    t.date "end_date"
    t.decimal "percentage", precision: 4, scale: 2
    t.bigint "degree_id"
    t.bigint "specialization_id"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_cgpa"
    t.index ["degree_id"], name: "index_academic_details_on_degree_id"
    t.index ["digital_cv_id"], name: "index_academic_details_on_digital_cv_id"
    t.index ["specialization_id"], name: "index_academic_details_on_specialization_id"
  end

  create_table "certifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "certifier"
    t.date "date"
    t.text "details"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_certifications_on_digital_cv_id"
  end

  create_table "community_answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "answer_text"
    t.integer "vote_count"
    t.boolean "anonymus"
    t.bigint "community_question_id"
    t.bigint "user_id"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_question_id"], name: "index_community_answers_on_community_question_id"
    t.index ["user_id"], name: "index_community_answers_on_user_id"
  end

  create_table "community_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question_text"
    t.text "brief_details"
    t.integer "vote_count"
    t.integer "view_count"
    t.bigint "user_id"
    t.boolean "anonymus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_community_questions_on_user_id"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "mobile"
    t.string "linkedin_url"
    t.string "skype_username"
    t.text "address"
    t.integer "pincode"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_contact_details_on_digital_cv_id"
  end

  create_table "cv_analytics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "digital_cv_id"
    t.boolean "viewed"
    t.boolean "downloaded"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_cv_analytics_on_digital_cv_id"
  end

  create_table "cv_languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "digital_cv_id"
    t.bigint "language_id"
    t.boolean "read"
    t.boolean "write"
    t.boolean "speak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_cv_languages_on_digital_cv_id"
    t.index ["language_id"], name: "index_cv_languages_on_language_id"
  end

  create_table "cv_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "digital_cv_id"
    t.bigint "skill_id"
    t.string "type"
    t.integer "self_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_cv_skills_on_digital_cv_id"
    t.index ["skill_id"], name: "index_cv_skills_on_skill_id"
  end

  create_table "degrees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "digital_cvs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "My Resume"
    t.text "summary"
    t.text "objective"
    t.boolean "is_experienced", default: true
    t.string "employment_status"
    t.bigint "user_id"
    t.bigint "template_id"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_digital_cvs_on_slug"
    t.index ["template_id"], name: "index_digital_cvs_on_template_id"
    t.index ["user_id"], name: "index_digital_cvs_on_user_id"
  end

  create_table "employment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "job_title_id"
    t.bigint "digital_cv_id"
    t.bigint "company_id"
    t.date "start_date"
    t.date "end_date"
    t.boolean "present_job"
    t.text "responsibilities"
    t.text "achievement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employment_details_on_company_id"
    t.index ["digital_cv_id"], name: "index_employment_details_on_digital_cv_id"
    t.index ["job_title_id"], name: "index_employment_details_on_job_title_id"
  end

  create_table "honor_and_awards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.date "award_date"
    t.string "awarded_by"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.index ["digital_cv_id"], name: "index_honor_and_awards_on_digital_cv_id"
  end

  create_table "industries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.bigint "mobile"
    t.text "body"
    t.string "type"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "gender"
    t.date "date_of_birth"
    t.string "marital_status"
    t.string "nationality"
    t.boolean "disabled"
    t.text "hobbies"
    t.text "affiliations"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_personal_details_on_digital_cv_id"
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "image_type"
    t.index ["imageable_type", "imageable_id"], name: "index_photos_on_imageable_type_and_imageable_id"
  end

  create_table "qualifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "job_title_id"
    t.string "email"
    t.bigint "mobile"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.index ["digital_cv_id"], name: "index_references_on_digital_cv_id"
    t.index ["job_title_id"], name: "index_references_on_job_title_id"
  end

  create_table "research_or_project_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "url"
    t.string "guide"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_research_or_project_details_on_digital_cv_id"
  end

  create_table "skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specializations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "template_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "info"
    t.integer "duration"
    t.string "institute"
    t.bigint "digital_cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_cv_id"], name: "index_trainings_on_digital_cv_id"
  end

  create_table "user_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_type_id"
    t.string "first_name"
    t.string "last_name"
    t.bigint "company_id"
    t.boolean "approved"
    t.bigint "job_title_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["job_title_id"], name: "index_users_on_job_title_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "voteable_type"
    t.bigint "voteable_id"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"
  end

  add_foreign_key "academic_details", "degrees"
  add_foreign_key "academic_details", "digital_cvs"
  add_foreign_key "academic_details", "specializations"
  add_foreign_key "certifications", "digital_cvs"
  add_foreign_key "community_answers", "community_questions"
  add_foreign_key "community_answers", "users"
  add_foreign_key "community_questions", "users"
  add_foreign_key "contact_details", "digital_cvs"
  add_foreign_key "cv_analytics", "digital_cvs"
  add_foreign_key "cv_languages", "digital_cvs"
  add_foreign_key "cv_languages", "languages"
  add_foreign_key "cv_skills", "digital_cvs"
  add_foreign_key "cv_skills", "skills"
  add_foreign_key "digital_cvs", "templates"
  add_foreign_key "digital_cvs", "users"
  add_foreign_key "employment_details", "companies"
  add_foreign_key "employment_details", "digital_cvs"
  add_foreign_key "employment_details", "job_titles"
  add_foreign_key "honor_and_awards", "digital_cvs"
  add_foreign_key "personal_details", "digital_cvs"
  add_foreign_key "references", "digital_cvs"
  add_foreign_key "references", "job_titles"
  add_foreign_key "research_or_project_details", "digital_cvs"
  add_foreign_key "trainings", "digital_cvs"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "job_titles"
  add_foreign_key "users", "user_types"
  add_foreign_key "votes", "users"
end
