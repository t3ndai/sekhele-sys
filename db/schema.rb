# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_03_092710) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "asset_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_asset_categories_on_organization_id"
  end

  create_table "benefit_elections", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "benefit_plan_id", null: false
    t.date "selected_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_plan_id"], name: "index_benefit_elections_on_benefit_plan_id"
    t.index ["employee_id"], name: "index_benefit_elections_on_employee_id"
  end

  create_table "benefit_plans", force: :cascade do |t|
    t.bigint "benefit_id", null: false
    t.string "name"
    t.decimal "employer_contribution"
    t.decimal "employee_contribution"
    t.string "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_benefit_plans_on_benefit_id"
  end

  create_table "benefit_types", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_benefit_types_on_organization_id"
  end

  create_table "benefits", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "benefit_type_id", null: false
    t.string "name"
    t.string "valuation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_type_id"], name: "index_benefits_on_benefit_type_id"
    t.index ["organization_id"], name: "index_benefits_on_organization_id"
  end

  create_table "candidate_notes", force: :cascade do |t|
    t.bigint "job_applicant_id", null: false
    t.bigint "employee_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_candidate_notes_on_employee_id"
    t.index ["job_applicant_id"], name: "index_candidate_notes_on_job_applicant_id"
  end

  create_table "company_files", force: :cascade do |t|
    t.string "name"
    t.bigint "document_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_company_files_on_document_id"
    t.index ["organization_id"], name: "index_company_files_on_organization_id"
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "code"
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_cost_centers_on_organization_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_departments_on_organization_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "document_type"
    t.boolean "required"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_documents_on_organization_id"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone1"
    t.string "phone2"
    t.string "addr_line1"
    t.string "addr_line2"
    t.string "addr_lin3"
    t.string "city"
    t.string "postcode"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_emergency_contacts_on_employee_id"
  end

  create_table "employee_files", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["document_id"], name: "index_employee_files_on_document_id"
    t.index ["employee_id"], name: "index_employee_files_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "dob", null: false
    t.string "addr_line1"
    t.string "addr_line2"
    t.string "addr_line3"
    t.string "addr_postcode"
    t.string "city", null: false
    t.string "country", null: false
    t.string "phone1", null: false
    t.string "phone2"
    t.string "personal_email", null: false
    t.string "work_email", null: false
    t.string "id_number", null: false
    t.string "nationality", null: false
    t.string "passport_number"
    t.date "hire_date", null: false
    t.string "employement_id"
    t.string "preferred_name"
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender"
    t.bigint "manager_id"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
    t.index ["organization_id"], name: "index_employees_on_organization_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "action", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "interview_feedbacks", force: :cascade do |t|
    t.bigint "interview_id", null: false
    t.bigint "interviewer_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_interview_feedbacks_on_interview_id"
    t.index ["interviewer_id"], name: "index_interview_feedbacks_on_interviewer_id"
  end

  create_table "interview_stages", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "mandatory"
    t.string "stage_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_interview_stages_on_organization_id"
  end

  create_table "interviewers", force: :cascade do |t|
    t.bigint "interview_id", null: false
    t.bigint "employee_id", null: false
    t.date "assigned_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_interviewers_on_employee_id"
    t.index ["interview_id"], name: "index_interviewers_on_interview_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.bigint "interview_stage_id", null: false
    t.date "interview_on"
    t.time "interview_at"
    t.string "meeting_link"
    t.string "room"
    t.string "location"
    t.bigint "job_applicant_id", null: false
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_stage_id"], name: "index_interviews_on_interview_stage_id"
    t.index ["job_applicant_id"], name: "index_interviews_on_job_applicant_id"
  end

  create_table "job_applicants", force: :cascade do |t|
    t.bigint "job_posting_id", null: false
    t.date "applied_on"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_posting_id"], name: "index_job_applicants_on_job_posting_id"
  end

  create_table "job_functions", force: :cascade do |t|
    t.string "title"
    t.bigint "department_id"
    t.bigint "organization_id", null: false
    t.numrange "salary_range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_job_functions_on_department_id"
    t.index ["organization_id"], name: "index_job_functions_on_organization_id"
  end

  create_table "job_levels", force: :cascade do |t|
    t.bigint "job_function_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.numrange "salary_range"
    t.integer "range_percentile"
    t.index ["job_function_id"], name: "index_job_levels_on_job_function_id"
  end

  create_table "job_postings", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.integer "num_positions"
    t.string "title"
    t.date "date_open"
    t.date "date_close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_job_postings_on_organization_id"
  end

  create_table "leave_balances", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "leave_policy_id", null: false
    t.integer "time_taken", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leave_balances_on_employee_id"
    t.index ["leave_policy_id"], name: "index_leave_balances_on_leave_policy_id"
  end

  create_table "leave_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_leave_categories_on_organization_id"
  end

  create_table "leave_policies", force: :cascade do |t|
    t.bigint "leave_category_id", null: false
    t.integer "start_balance"
    t.date "valid_from"
    t.date "valid_to"
    t.bigint "organization_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leave_category_id"], name: "index_leave_policies_on_leave_category_id"
    t.index ["organization_id"], name: "index_leave_policies_on_organization_id"
  end

  create_table "leave_requests", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "leave_policy_id", null: false
    t.string "status"
    t.date "date_from"
    t.date "date_to"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leave_requests_on_employee_id"
    t.index ["leave_policy_id"], name: "index_leave_requests_on_leave_policy_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id", null: false
    t.string "addr_line1"
    t.string "addr_line2"
    t.string "addr_line3"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_locations_on_organization_id"
  end

  create_table "org_assets", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "asset_category_id", null: false
    t.date "date_given"
    t.date "date_returned"
    t.string "asset_name"
    t.string "asset_serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_category_id"], name: "index_org_assets_on_asset_category_id"
    t.index ["employee_id"], name: "index_org_assets_on_employee_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recovery_codes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "code", null: false
    t.boolean "used", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recovery_codes_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "sudo_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "time_workeds", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.text "note"
    t.date "day"
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_time_workeds_on_employee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.boolean "otp_required_for_sign_in", default: false, null: false
    t.string "otp_secret", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employee_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_id"], name: "index_users_on_employee_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "asset_categories", "organizations"
  add_foreign_key "benefit_elections", "benefit_plans"
  add_foreign_key "benefit_elections", "employees"
  add_foreign_key "benefit_plans", "benefits"
  add_foreign_key "benefit_types", "organizations"
  add_foreign_key "benefits", "benefit_types"
  add_foreign_key "benefits", "organizations"
  add_foreign_key "candidate_notes", "employees"
  add_foreign_key "candidate_notes", "job_applicants"
  add_foreign_key "company_files", "documents"
  add_foreign_key "company_files", "organizations"
  add_foreign_key "cost_centers", "organizations"
  add_foreign_key "departments", "organizations"
  add_foreign_key "documents", "organizations"
  add_foreign_key "emergency_contacts", "employees"
  add_foreign_key "employee_files", "documents"
  add_foreign_key "employee_files", "employees"
  add_foreign_key "employees", "employees", column: "manager_id"
  add_foreign_key "employees", "organizations"
  add_foreign_key "events", "users"
  add_foreign_key "interview_feedbacks", "interviewers"
  add_foreign_key "interview_feedbacks", "interviews"
  add_foreign_key "interview_stages", "organizations"
  add_foreign_key "interviewers", "employees"
  add_foreign_key "interviewers", "interviews"
  add_foreign_key "interviews", "interview_stages"
  add_foreign_key "interviews", "job_applicants"
  add_foreign_key "job_applicants", "job_postings"
  add_foreign_key "job_functions", "departments"
  add_foreign_key "job_functions", "organizations"
  add_foreign_key "job_levels", "job_functions"
  add_foreign_key "job_postings", "organizations"
  add_foreign_key "leave_balances", "employees"
  add_foreign_key "leave_balances", "leave_policies"
  add_foreign_key "leave_categories", "organizations"
  add_foreign_key "leave_policies", "leave_categories"
  add_foreign_key "leave_policies", "organizations"
  add_foreign_key "leave_requests", "employees"
  add_foreign_key "leave_requests", "leave_policies"
  add_foreign_key "locations", "organizations"
  add_foreign_key "org_assets", "asset_categories"
  add_foreign_key "org_assets", "employees"
  add_foreign_key "recovery_codes", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "time_workeds", "employees"
end
