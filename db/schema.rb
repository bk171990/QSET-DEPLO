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

ActiveRecord::Schema.define(version: 20150122072350078) do

  create_table "apply_leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.integer  "employee_leave_types_id"
    t.boolean  "is_half_day"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "reason"
    t.boolean  "approved",                default: false
    t.boolean  "viewed_by_manager",       default: false
    t.string   "manager_remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_apply_leaves_on_employee_id", using: :btree
    t.index ["employee_leave_types_id"], name: "index_apply_leaves_on_employee_leave_types_id", using: :btree
  end

  create_table "archived_employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_category_id"
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.boolean  "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail",      limit: 65535
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "nationality_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.integer  "former_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["country_id"], name: "index_archived_employees_on_country_id", using: :btree
    t.index ["employee_department_id"], name: "index_archived_employees_on_employee_department_id", using: :btree
    t.index ["employee_grade_id"], name: "index_archived_employees_on_employee_grade_id", using: :btree
    t.index ["employee_position_id"], name: "index_archived_employees_on_employee_position_id", using: :btree
  end

  create_table "archived_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.integer  "immediate_contact"
    t.boolean  "is_sms_enabled",     default: true
    t.string   "status_description"
    t.boolean  "is_active",          default: true
    t.boolean  "is_deleted",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["batch_id"], name: "index_archived_students_on_batch_id", using: :btree
    t.index ["category_id"], name: "index_archived_students_on_category_id", using: :btree
  end

  create_table "assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.decimal  "amount",                    precision: 10
    t.boolean  "is_inactive",                              default: false
    t.boolean  "is_deleted",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignment_attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "assignment_id"
    t.string   "file"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_assignment_attachments_on_assignment_id", using: :btree
  end

  create_table "assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "content"
    t.string   "file"
    t.string   "file_file_name"
    t.date     "due_date"
    t.integer  "subject_id"
    t.integer  "batch_id"
    t.integer  "student_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "file_filename"
    t.string   "file_content_type"
    t.string   "file_data"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "assignment_subject"
    t.index ["batch_id"], name: "index_assignments_on_batch_id", using: :btree
    t.index ["student_id"], name: "index_assignments_on_student_id", using: :btree
    t.index ["subject_id"], name: "index_assignments_on_subject_id", using: :btree
  end

  create_table "attendences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "time_table_entry_id"
    t.integer  "batch_id"
    t.integer  "subject_id"
    t.date     "month_date"
    t.string   "reason"
    t.boolean  "is_absent"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["batch_id"], name: "index_attendences_on_batch_id", using: :btree
    t.index ["student_id"], name: "index_attendences_on_student_id", using: :btree
    t.index ["subject_id"], name: "index_attendences_on_subject_id", using: :btree
    t.index ["time_table_entry_id"], name: "index_attendences_on_time_table_entry_id", using: :btree
  end

  create_table "bank_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "batch_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_batch_events_on_batch_id", using: :btree
    t.index ["event_id"], name: "index_batch_events_on_event_id", using: :btree
  end

  create_table "batch_fee_collection_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_id"], name: "index_batch_groups_on_course_id", using: :btree
  end

  create_table "batches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "course_id"
    t.string   "employee_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_active",   default: true
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_id"], name: "index_batches_on_course_id", using: :btree
  end

  create_table "batches_finance_fee_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "finance_fee_category_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_batches_finance_fee_categories_on_batch_id", using: :btree
    t.index ["finance_fee_category_id"], name: "index_batches_finance_fee_categories_on_finance_fee_category_id", using: :btree
  end

  create_table "batches_online_exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "online_exam_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_batches_online_exams_on_batch_id", using: :btree
    t.index ["online_exam_id"], name: "index_batches_online_exams_on_online_exam_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_designations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.decimal  "cgpa",       precision: 10
    t.decimal  "marks",      precision: 10
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_id"], name: "index_class_designations_on_course_id", using: :btree
  end

  create_table "class_timings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "batch_id"
    t.string   "name"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "is_break"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_class_timings_on_batch_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "statement",   limit: 65535
    t.integer  "newscast_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["newscast_id"], name: "index_comments_on_newscast_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "criteria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "course_name"
    t.string   "code"
    t.string   "section_name"
    t.string   "grading_type"
    t.boolean  "is_deleted",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elective_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_elective_groups_on_batch_id", using: :btree
  end

  create_table "employee_attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "attendance_date"
    t.integer  "employee_id"
    t.integer  "employee_leave_type_id"
    t.string   "reason"
    t.boolean  "is_half_day"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_employee_attendances_on_employee_id", using: :btree
    t.index ["employee_leave_type_id"], name: "index_employee_attendances_on_employee_leave_type_id", using: :btree
  end

  create_table "employee_bank_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.integer  "bank_field_id"
    t.string   "bank_info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["bank_field_id"], name: "index_employee_bank_details_on_bank_field_id", using: :btree
    t.index ["employee_id"], name: "index_employee_bank_details_on_employee_id", using: :btree
  end

  create_table "employee_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "prefix"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_department_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "event_id"
    t.integer  "employee_department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_department_id"], name: "index_employee_department_events_on_employee_department_id", using: :btree
    t.index ["event_id"], name: "index_employee_department_events_on_event_id", using: :btree
  end

  create_table "employee_departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "priority"
    t.boolean  "status"
    t.integer  "max_hours_day"
    t.integer  "max_hours_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_leave_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "status"
    t.string   "max_leave_count"
    t.boolean  "enable_carry_forward"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.integer  "employee_leave_type_id"
    t.decimal  "leave_count",            precision: 10
    t.decimal  "leave_taken",            precision: 10, scale: 2
    t.date     "reset_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_employee_leaves_on_employee_id", using: :btree
    t.index ["employee_leave_type_id"], name: "index_employee_leaves_on_employee_leave_type_id", using: :btree
  end

  create_table "employee_positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "employee_category_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_category_id"], name: "index_employee_positions_on_employee_category_id", using: :btree
  end

  create_table "employee_salary_structures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.integer  "payroll_category_id"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_employee_salary_structures_on_employee_id", using: :btree
    t.index ["payroll_category_id"], name: "index_employee_salary_structures_on_payroll_category_id", using: :btree
  end

  create_table "employee_salery_structures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.integer  "payroll_category_id"
    t.string   "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_employee_salery_structures_on_employee_id", using: :btree
    t.index ["payroll_category_id"], name: "index_employee_salery_structures_on_payroll_category_id", using: :btree
  end

  create_table "employee_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_employee_subjects_on_employee_id", using: :btree
    t.index ["subject_id"], name: "index_employee_subjects_on_subject_id", using: :btree
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_category_id"
    t.integer  "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail",      limit: 65535
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "country_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["country_id"], name: "index_employees_on_country_id", using: :btree
    t.index ["employee_category_id"], name: "index_employees_on_employee_category_id", using: :btree
    t.index ["employee_department_id"], name: "index_employees_on_employee_department_id", using: :btree
    t.index ["employee_grade_id"], name: "index_employees_on_employee_grade_id", using: :btree
    t.index ["employee_position_id"], name: "index_employees_on_employee_position_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_common",   default: false
    t.boolean  "is_holiday",  default: false
    t.boolean  "is_exam",     default: false
    t.boolean  "is_due",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.string   "exam_type"
    t.boolean  "is_published",     default: false
    t.boolean  "result_published", default: false
    t.date     "exam_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_exam_groups_on_batch_id", using: :btree
  end

  create_table "exam_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.decimal  "marks",            precision: 10
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["exam_id"], name: "index_exam_scores_on_exam_id", using: :btree
    t.index ["grading_level_id"], name: "index_exam_scores_on_grading_level_id", using: :btree
    t.index ["student_id"], name: "index_exam_scores_on_student_id", using: :btree
  end

  create_table "exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "exam_group_id"
    t.integer  "subject_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "maximum_marks"
    t.integer  "minimum_marks"
    t.integer  "grading_level_id"
    t.integer  "weightage",        default: 0
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_id"], name: "index_exams_on_event_id", using: :btree
    t.index ["exam_group_id"], name: "index_exams_on_exam_group_id", using: :btree
    t.index ["grading_level_id"], name: "index_exams_on_grading_level_id", using: :btree
    t.index ["subject_id"], name: "index_exams_on_subject_id", using: :btree
  end

  create_table "fee_collection_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.string   "name"
    t.decimal  "discount",                  precision: 10
    t.integer  "finance_fee_collection_id"
    t.integer  "category_id"
    t.string   "admission_no"
    t.integer  "batch_id"
    t.boolean  "is_deleted",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_fee_collection_discounts_on_batch_id", using: :btree
    t.index ["category_id"], name: "index_fee_collection_discounts_on_category_id", using: :btree
    t.index ["finance_fee_collection_id"], name: "index_fee_collection_discounts_on_finance_fee_collection_id", using: :btree
  end

  create_table "fee_collection_discounts_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "fee_collection_discount_id"
    t.integer  "[{:index=>true, :name=>\"discount_id\"}]_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id"], name: "index_fee_collection_discounts_students_on_student_id", using: :btree
  end

  create_table "fee_collection_particulars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",               limit: 65535
    t.decimal  "amount",                                  precision: 10
    t.integer  "finance_fee_collection_id"
    t.integer  "category_id"
    t.string   "admission_no"
    t.integer  "batch_id"
    t.boolean  "is_deleted",                                             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_fee_collection_particulars_on_batch_id", using: :btree
    t.index ["category_id"], name: "index_fee_collection_particulars_on_category_id", using: :btree
    t.index ["finance_fee_collection_id"], name: "index_fee_collection_particulars_on_finance_fee_collection_id", using: :btree
  end

  create_table "fee_collection_particulars_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "fee_collection_particular_id"
    t.integer  "[{:index=>true, :name=>\"particular_id\"}]_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id"], name: "index_fee_collection_particulars_students_on_student_id", using: :btree
  end

  create_table "fee_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "type"
    t.string   "name"
    t.decimal  "discount",                precision: 10
    t.integer  "finance_fee_category_id"
    t.integer  "category_id"
    t.string   "admission_no"
    t.integer  "batch_id"
    t.boolean  "is_deleted",                             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_fee_discounts_on_batch_id", using: :btree
    t.index ["category_id"], name: "index_fee_discounts_on_category_id", using: :btree
    t.index ["finance_fee_category_id"], name: "index_fee_discounts_on_finance_fee_category_id", using: :btree
  end

  create_table "finance_donations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "donor"
    t.string   "description"
    t.decimal  "amount",                 precision: 10
    t.date     "transaction_date"
    t.integer  "finance_transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["finance_transaction_id"], name: "index_finance_donations_on_finance_transaction_id", using: :btree
  end

  create_table "finance_fee_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.boolean  "is_deleted",                default: false
    t.boolean  "is_master",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_fee_collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "due_date"
    t.integer  "finance_fee_category_id"
    t.integer  "batch_id"
    t.boolean  "is_deleted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_finance_fee_collections_on_batch_id", using: :btree
    t.index ["finance_fee_category_id"], name: "index_finance_fee_collections_on_finance_fee_category_id", using: :btree
  end

  create_table "finance_fee_particulars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description",             limit: 65535
    t.decimal  "amount",                                precision: 10
    t.integer  "finance_fee_category_id"
    t.integer  "category_id"
    t.string   "admission_no"
    t.integer  "batch_id"
    t.boolean  "is_deleted",                                           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_finance_fee_particulars_on_batch_id", using: :btree
    t.index ["category_id"], name: "index_finance_fee_particulars_on_category_id", using: :btree
    t.index ["finance_fee_category_id"], name: "index_finance_fee_particulars_on_finance_fee_category_id", using: :btree
  end

  create_table "finance_fee_structure_elements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "amount",            precision: 10
    t.string   "label"
    t.integer  "batch_id"
    t.integer  "category_id"
    t.integer  "student_id"
    t.integer  "guardian_id"
    t.integer  "fee_collection_id"
    t.boolean  "is_deleted",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_finance_fee_structure_elements_on_batch_id", using: :btree
    t.index ["category_id"], name: "index_finance_fee_structure_elements_on_category_id", using: :btree
    t.index ["fee_collection_id"], name: "index_finance_fee_structure_elements_on_fee_collection_id", using: :btree
    t.index ["guardian_id"], name: "index_finance_fee_structure_elements_on_guardian_id", using: :btree
    t.index ["student_id"], name: "index_finance_fee_structure_elements_on_student_id", using: :btree
  end

  create_table "finance_fees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "finance_fee_collection_id"
    t.integer  "student_id"
    t.string   "receipt_no"
    t.boolean  "is_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["finance_fee_collection_id"], name: "index_finance_fees_on_finance_fee_collection_id", using: :btree
    t.index ["student_id"], name: "index_finance_fees_on_student_id", using: :btree
  end

  create_table "finance_fines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "finance_fee_id"
    t.date     "fine_date"
    t.decimal  "fine",           precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["finance_fee_id"], name: "index_finance_fines_on_finance_fee_id", using: :btree
  end

  create_table "finance_transaction_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_income"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_transaction_triggers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "percentage",  precision: 10
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_finance_transaction_triggers_on_category_id", using: :btree
  end

  create_table "finance_transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "amount",                          precision: 10
    t.date     "transaction_date"
    t.boolean  "fine_included",                                  default: false
    t.integer  "student_id"
    t.integer  "finance_fee_id"
    t.integer  "finance_transaction_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["finance_fee_id"], name: "index_finance_transactions_on_finance_fee_id", using: :btree
    t.index ["finance_transaction_category_id"], name: "index_finance_transactions_on_finance_transaction_category_id", using: :btree
    t.index ["student_id"], name: "index_finance_transactions_on_student_id", using: :btree
  end

  create_table "general_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "school_or_college_name"
    t.string   "school_or_college_address"
    t.string   "school_or_college_phone_no"
    t.date     "finance_start_year_date"
    t.date     "finance_end_year_date"
    t.string   "language"
    t.string   "time_zone"
    t.string   "country"
    t.string   "include_grading_system"
    t.integer  "addmission_number_auto_increament"
    t.integer  "employee_number_auto_increament"
    t.string   "enable_news_comment_moderation"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grading_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.integer  "min_score"
    t.string   "description"
    t.integer  "order"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_grading_levels_on_batch_id", using: :btree
  end

  create_table "group_batches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "batch_group_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_group_id"], name: "index_group_batches_on_batch_group_id", using: :btree
    t.index ["batch_id"], name: "index_group_batches_on_batch_id", using: :btree
  end

  create_table "grouped_exam_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "batch_id"
    t.integer  "student_id"
    t.integer  "exam_group_id"
    t.decimal  "marks",         precision: 10
    t.string   "score_type"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_grouped_exam_reports_on_batch_id", using: :btree
    t.index ["exam_group_id"], name: "index_grouped_exam_reports_on_exam_group_id", using: :btree
    t.index ["student_id"], name: "index_grouped_exam_reports_on_student_id", using: :btree
    t.index ["subject_id"], name: "index_grouped_exam_reports_on_subject_id", using: :btree
  end

  create_table "guardians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "email"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.date     "dob"
    t.string   "occupation"
    t.string   "income"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["country_id"], name: "index_guardians_on_country_id", using: :btree
    t.index ["student_id"], name: "index_guardians_on_student_id", using: :btree
  end

  create_table "individual_payslip_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "employee_id"
    t.date     "salary_date"
    t.string   "name"
    t.string   "amount"
    t.boolean  "is_deduction"
    t.boolean  "include_every_month"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_individual_payslip_categories_on_employee_id", using: :btree
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "liabilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.decimal  "amount",                    precision: 10
    t.boolean  "is_solved",                                default: false
    t.boolean  "is_deleted",                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_payslips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "salary_date"
    t.integer  "employee_id"
    t.integer  "payroll_category_id"
    t.string   "amount"
    t.boolean  "is_approved",         default: false, null: false
    t.integer  "approver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["approver_id"], name: "index_monthly_payslips_on_approver_id", using: :btree
    t.index ["employee_id"], name: "index_monthly_payslips_on_employee_id", using: :btree
    t.index ["payroll_category_id"], name: "index_monthly_payslips_on_payroll_category_id", using: :btree
  end

  create_table "newscasts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_newscasts_on_user_id", using: :btree
  end

  create_table "online_exam_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "online_exam_id"
    t.string   "question"
    t.integer  "marks"
    t.integer  "is_answer"
    t.string   "option_group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["online_exam_id"], name: "index_online_exam_questions_on_online_exam_id", using: :btree
  end

  create_table "online_exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.time     "maximum_time"
    t.decimal  "percentage",          precision: 10
    t.integer  "option_per_question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "option"
    t.boolean  "is_answer"
    t.integer  "question_database_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["question_database_id"], name: "index_options_on_question_database_id", using: :btree
  end

  create_table "payroll_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "percentage",          limit: 24
    t.integer  "payroll_category_id"
    t.boolean  "is_deduction"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["payroll_category_id"], name: "index_payroll_categories_on_payroll_category_id", using: :btree
  end

  create_table "placement_exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "question_count"
    t.time     "timeperiod"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["company_id"], name: "index_placement_exams_on_company_id", using: :btree
  end

  create_table "placement_news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "islink"
  end

  create_table "privilege_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privilege_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "privilege_id"
    t.integer  "user_id"
    t.integer  "privilege_tag_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["privilege_id"], name: "index_privilege_users_on_privilege_id", using: :btree
    t.index ["privilege_tag_id"], name: "index_privilege_users_on_privilege_tag_id", using: :btree
    t.index ["user_id"], name: "index_privilege_users_on_user_id", using: :btree
  end

  create_table "privileges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "privilege_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["privilege_tag_id"], name: "index_privileges_on_privilege_tag_id", using: :btree
  end

  create_table "question_databases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "question_type_id"
    t.string   "question"
    t.integer  "no_of_option"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["question_type_id"], name: "index_question_databases_on_question_type_id", using: :btree
  end

  create_table "question_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "que_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qusetion_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "que_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qusetions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "question"
    t.integer  "question_type_id"
    t.integer  "question_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["question_type_id"], name: "index_qusetions_on_question_type_id", using: :btree
  end

  create_table "ranking_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.decimal  "gpa",                precision: 10
    t.decimal  "marks",              precision: 10
    t.integer  "subject_count"
    t.integer  "prioriy"
    t.boolean  "full_course"
    t.integer  "course_id"
    t.string   "subject_limit_type"
    t.string   "marks_limit_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["course_id"], name: "index_ranking_levels_on_course_id", using: :btree
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "model"
    t.integer  "student_id"
    t.integer  "guardian_id"
    t.integer  "user_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_reports_on_employee_id", using: :btree
    t.index ["guardian_id"], name: "index_reports_on_guardian_id", using: :btree
    t.index ["student_id"], name: "index_reports_on_student_id", using: :btree
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "percentage", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_answer_sheets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_exams_id"
    t.integer  "question_databases_id"
    t.integer  "options_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["options_id"], name: "index_student_answer_sheets_on_options_id", using: :btree
    t.index ["question_databases_id"], name: "index_student_answer_sheets_on_question_databases_id", using: :btree
    t.index ["student_exams_id"], name: "index_student_answer_sheets_on_student_exams_id", using: :btree
  end

  create_table "student_category_fee_collection_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_category_fee_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "placement_exams_id"
    t.integer  "students_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["placement_exams_id"], name: "index_student_exams_on_placement_exams_id", using: :btree
    t.index ["students_id"], name: "index_student_exams_on_students_id", using: :btree
  end

  create_table "student_fee_collection_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_fee_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "year"
    t.decimal  "marks",      precision: 10
    t.integer  "student_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_student_informations_on_batch_id", using: :btree
    t.index ["student_id"], name: "index_student_informations_on_student_id", using: :btree
  end

  create_table "student_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "mark",          precision: 10
    t.integer  "maximum_marks"
    t.integer  "student_id"
    t.integer  "subject_id"
    t.integer  "exam_group_id"
    t.integer  "batch_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["batch_id"], name: "index_student_logs_on_batch_id", using: :btree
    t.index ["exam_group_id"], name: "index_student_logs_on_exam_group_id", using: :btree
    t.index ["student_id"], name: "index_student_logs_on_student_id", using: :btree
    t.index ["subject_id"], name: "index_student_logs_on_subject_id", using: :btree
  end

  create_table "student_previous_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.string   "institution"
    t.string   "year"
    t.string   "course"
    t.string   "total_mark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id"], name: "index_student_previous_data_on_student_id", using: :btree
  end

  create_table "student_previous_subject_marks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.string   "subject"
    t.string   "mark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id"], name: "index_student_previous_subject_marks_on_student_id", using: :btree
  end

  create_table "student_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "placement_exams_id"
    t.float    "score",              limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.boolean  "is_qualify"
    t.index ["placement_exams_id"], name: "index_student_scores_on_placement_exams_id", using: :btree
    t.index ["student_id"], name: "index_student_scores_on_student_id", using: :btree
  end

  create_table "student_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "subject_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_student_subjects_on_batch_id", using: :btree
    t.index ["student_id"], name: "index_student_subjects_on_student_id", using: :btree
    t.index ["subject_id"], name: "index_student_subjects_on_subject_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.integer  "immediate_contact"
    t.boolean  "is_sms_enabled",     default: true
    t.string   "status_description"
    t.boolean  "is_active",          default: true
    t.boolean  "is_deleted",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["batch_id"], name: "index_students_on_batch_id", using: :btree
    t.index ["category_id"], name: "index_students_on_category_id", using: :btree
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "batch_id"
    t.boolean  "no_exams",           default: false
    t.integer  "max_weekly_classes"
    t.integer  "elective_group_id"
    t.boolean  "is_deleted",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_subjects_on_batch_id", using: :btree
    t.index ["elective_group_id"], name: "index_subjects_on_elective_group_id", using: :btree
  end

  create_table "time_table_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "batch_id"
    t.integer  "weekday_id"
    t.integer  "class_timing_id"
    t.integer  "subject_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_table_id"
    t.index ["batch_id"], name: "index_time_table_entries_on_batch_id", using: :btree
    t.index ["class_timing_id"], name: "index_time_table_entries_on_class_timing_id", using: :btree
    t.index ["employee_id"], name: "index_time_table_entries_on_employee_id", using: :btree
    t.index ["subject_id"], name: "index_time_table_entries_on_subject_id", using: :btree
    t.index ["time_table_id"], name: "index_time_table_entries_on_time_table_id", using: :btree
    t.index ["weekday_id"], name: "index_time_table_entries_on_weekday_id", using: :btree
  end

  create_table "time_tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "modelname"
    t.integer  "model_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_user_activities_on_user_id", using: :btree
  end

  create_table "user_employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "employee_id"
    t.index ["employee_id"], name: "index_user_employees_on_employee_id", using: :btree
    t.index ["user_id"], name: "index_user_employees_on_user_id", using: :btree
  end

  create_table "user_privileges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "privilege_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["privilege_id"], name: "index_user_privileges_on_privilege_id", using: :btree
    t.index ["user_id"], name: "index_user_privileges_on_user_id", using: :btree
  end

  create_table "user_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.index ["student_id"], name: "index_user_students_on_student_id", using: :btree
    t.index ["user_id"], name: "index_user_students_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.integer  "student_id"
    t.integer  "employee_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "general_setting_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["general_setting_id"], name: "index_users_on_general_setting_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "weekdays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "batch_id"
    t.string   "weekday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_of_week"
    t.index ["batch_id"], name: "index_weekdays_on_batch_id", using: :btree
  end

  create_table "weightages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "percentage"
    t.integer  "placement_exam_id"
    t.integer  "question_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["placement_exam_id"], name: "index_weightages_on_placement_exam_id", using: :btree
    t.index ["question_type_id"], name: "index_weightages_on_question_type_id", using: :btree
  end

  add_foreign_key "assignment_attachments", "assignments"
  add_foreign_key "assignments", "batches"
  add_foreign_key "assignments", "students"
  add_foreign_key "assignments", "subjects"
  add_foreign_key "attendences", "batches"
  add_foreign_key "attendences", "students"
  add_foreign_key "attendences", "subjects"
  add_foreign_key "attendences", "time_table_entries"
  add_foreign_key "privilege_users", "privilege_tags"
  add_foreign_key "privilege_users", "privileges"
  add_foreign_key "privilege_users", "users"
  add_foreign_key "reports", "employees"
  add_foreign_key "reports", "guardians"
  add_foreign_key "reports", "students"
  add_foreign_key "reports", "users"
  add_foreign_key "student_logs", "batches"
  add_foreign_key "student_logs", "exam_groups"
  add_foreign_key "student_logs", "students"
  add_foreign_key "student_logs", "subjects"
  add_foreign_key "user_employees", "employees"
  add_foreign_key "user_employees", "users"
  add_foreign_key "user_privileges", "privileges"
  add_foreign_key "user_privileges", "users"
  add_foreign_key "user_students", "students"
  add_foreign_key "user_students", "users"
end
