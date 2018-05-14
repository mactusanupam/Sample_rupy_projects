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

ActiveRecord::Schema.define(version: 20180511095210) do

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

  create_table "billing_plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "plan_code"
    t.string "plan_name"
    t.decimal "plan_price", precision: 10, scale: 5
    t.string "plan_frequency"
    t.string "type"
    t.text "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "pincode"
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

  create_table "degrees_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "degree_id"
    t.bigint "job_id"
    t.index ["degree_id"], name: "index_degrees_jobs_on_degree_id"
    t.index ["job_id"], name: "index_degrees_jobs_on_job_id"
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
    t.integer "view", default: 0
    t.integer "download", default: 0
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

  create_table "job_applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "job_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.string "status", default: "Applied"
    t.string "recruiter_comment", default: "Application Received"
    t.index ["job_id"], name: "index_job_applications_on_job_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "job_responsibilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "responsibility_type"
    t.text "responsibility_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_title_id"
    t.index ["job_title_id"], name: "index_job_responsibilities_on_job_title_id"
  end

  create_table "job_titles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "industry_id"
    t.bigint "company_id"
    t.string "location"
    t.integer "offered_ctc"
    t.string "website_url"
    t.string "experience"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "qualification_id"
    t.bigint "user_id"
    t.integer "job_view", default: 0
    t.integer "no_of_openings", default: 0
    t.string "job_status", default: "Open"
    t.string "job_type", default: "Permanent"
    t.string "seniority_level"
    t.bigint "specialization_id"
    t.boolean "remote_location"
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["industry_id"], name: "index_jobs_on_industry_id"
    t.index ["qualification_id"], name: "index_jobs_on_qualification_id"
    t.index ["specialization_id"], name: "index_jobs_on_specialization_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "jobs_skills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "job_id"
    t.bigint "skill_id"
    t.index ["job_id"], name: "index_jobs_skills_on_job_id"
    t.index ["skill_id"], name: "index_jobs_skills_on_skill_id"
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

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "billing_plan_id"
    t.string "type"
    t.string "state"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "subscribeble_type"
    t.bigint "subscribeble_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_plan_id"], name: "index_subscriptions_on_billing_plan_id"
    t.index ["subscribeble_type", "subscribeble_id"], name: "index_subscriptions_on_subscribeble_type_and_subscribeble_id"
  end

  create_table "suspicious_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "job_id"
    t.string "reporter_email"
    t.text "comment"
    t.text "additional_comment"
    t.index ["job_id"], name: "index_suspicious_jobs_on_job_id"
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
  add_foreign_key "degrees_jobs", "degrees"
  add_foreign_key "degrees_jobs", "jobs"
  add_foreign_key "digital_cvs", "templates"
  add_foreign_key "digital_cvs", "users"
  add_foreign_key "employment_details", "companies"
  add_foreign_key "employment_details", "digital_cvs"
  add_foreign_key "employment_details", "job_titles"
  add_foreign_key "honor_and_awards", "digital_cvs"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_responsibilities", "job_titles"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "industries"
  add_foreign_key "jobs", "qualifications"
  add_foreign_key "jobs", "specializations"
  add_foreign_key "jobs", "users"
  add_foreign_key "jobs_skills", "jobs"
  add_foreign_key "jobs_skills", "skills"
  add_foreign_key "personal_details", "digital_cvs"
  add_foreign_key "references", "digital_cvs"
  add_foreign_key "references", "job_titles"
  add_foreign_key "research_or_project_details", "digital_cvs"
  add_foreign_key "subscriptions", "billing_plans"
  add_foreign_key "suspicious_jobs", "jobs"
  add_foreign_key "trainings", "digital_cvs"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "job_titles"
  add_foreign_key "users", "user_types"
  add_foreign_key "votes", "users"
end
