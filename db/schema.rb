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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141221144809) do

  create_table "basic_competencies", :force => true do |t|
    t.integer  "core_competency_id"
    t.integer  "seq_num"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "cities", :force => true do |t|
    t.integer  "country_id"
    t.integer  "province_id"
    t.string   "name"
    t.string   "city_ext"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "core_competencies", :force => true do |t|
    t.integer  "vocational_id"
    t.integer  "seq_num"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "country_ext"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "curicculums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "event_exams", :force => true do |t|
    t.integer  "event_id"
    t.text     "description"
    t.string   "exam_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "event_matters", :force => true do |t|
    t.integer  "event_id"
    t.text     "notes"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "event_participants", :force => true do |t|
    t.integer  "event_id"
    t.integer  "teacher_id"
    t.integer  "total_presence"
    t.integer  "event_exam_id"
    t.integer  "exam_grade"
    t.integer  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "event_prerequisites", :force => true do |t|
    t.integer  "event_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "max_event_count"
    t.integer  "min_long_teach"
    t.integer  "max_long_teach"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.integer  "vocational_id"
    t.date     "date_start"
    t.date     "date_end"
    t.text     "description"
    t.text     "result_notes"
    t.integer  "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "provinces", :force => true do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "event_exam_id"
    t.text     "content"
    t.text     "answer_1"
    t.text     "answer_2"
    t.text     "answer_3"
    t.text     "answer_4"
    t.integer  "right_answer"
    t.integer  "score"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "request_participants", :force => true do |t|
    t.integer  "school_request_id"
    t.integer  "teacher_id"
    t.text     "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "request_vocationals", :force => true do |t|
    t.integer  "school_request_id"
    t.integer  "vocational_id"
    t.text     "notes"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "school_requests", :force => true do |t|
    t.integer  "school_id"
    t.string   "reference_number"
    t.date     "request_date"
    t.text     "notes"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "school_vocationals", :force => true do |t|
    t.integer  "school_id"
    t.integer  "vocational_id"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "nss"
    t.string   "npsn"
    t.string   "name"
    t.integer  "status"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "province_id"
    t.integer  "country_id"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.integer  "curicculum_id"
    t.string   "built_year"
    t.string   "start_year"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "teacher_histories", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "event_id"
    t.integer  "event_participant_id"
    t.integer  "status"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "teacher_vocationals", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "vocational_id"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "teachers", :force => true do |t|
    t.integer  "school_id"
    t.string   "nip"
    t.string   "front_title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "end_title"
    t.string   "born_place"
    t.date     "born_date"
    t.integer  "gender"
    t.string   "email"
    t.integer  "religion"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "province_id"
    t.integer  "country_id"
    t.string   "start_teach"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "vocationals", :force => true do |t|
    t.integer  "curicculum_id"
    t.string   "name"
    t.string   "class_for"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
